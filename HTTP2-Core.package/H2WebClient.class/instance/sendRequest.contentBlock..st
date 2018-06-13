accessing
sendRequest: request contentBlock: contentBlock
	"Send an http request"

	|  response repeatRedirect repeatAuth |

	"XXXX: Fixme. Pre-authenticate the request if we have valid auth credentials"

	redirections := Dictionary new.
	
	["The outer loop handles redirections"
	repeatRedirect := false.

	"Always update the host header due to redirect"
	request headerAt: 'Host' put: server.

		["The inner loop handles authentication"
		repeatAuth := false.

		"Connect can fail if SSL proxy CONNECT is involved"
		self connect ifNotNil:[:resp| ^resp].
		
		"Write the request to the debugLog if present"
		debugLog ifNotNil:[self writeRequest: request on: debugLog].

		response := (self serverProtocolDictionary includesKey: self serverName)
			ifFalse: [ self writeRequest: request on: stream.
						contentBlock value: stream.

						response := request newResponse readFrom: stream.
						response url: (scheme, '://', server, request rawUrl).
						response code = 101 
						ifTrue: [
							self serverProtocolDictionary  at: self serverName put: #h2c.
							self h2Session:( H2Session newWithStream: response stream at: self serverName ).
							^ self h2Session newH2WebResponseFor: self h2Session receive ]
						ifFalse: [
							self serverProtocolDictionary at: self serverName put: #http.
							^ response ].] 
			ifTrue: [ ^ (self serverProtocolDictionary at: self serverName) = #h2
					ifTrue: [
								^ self h2Session newH2WebResponseFor: (self h2Session send: ( self h2Session newRequestFor: (self getPathFrom: self request url))).]
					ifFalse: [
						self writeRequest: request on: stream.
						contentBlock value: stream.

						response := request newResponse readFrom: stream.]].
		
		"
		if h2 priorKnolege == ture do h2 Session send request
		else if h2 priorKnolege == false do send request itself
		else no priorknowlege upgrade
		
		"
		
		"Send the request itself"
		
		debugLog ifNotNil:[
			response writeOn: debugLog.
			debugLog flush.
		].
		response setCookiesDo:[:cookie| 
			self acceptCookie: cookie host: self serverUrlName path: request url.
		].
		accessLog ifNotNil:[
			WebUtils logRequest: request response: response on: accessLog
		].
		"Handle authentication if needed"
		(self allowAuth and:[response code = 401 or:[response code = 407]]) ifTrue:[
			"Eat up the content of the previous response"
			response content.
			repeatAuth := self authenticate: request from: response.
		].

		repeatAuth] whileTrue.

	"Flush previous authState.
	XXXX: Fixme. authState must be preserved for pre-authentication of requests."
	self flushAuthState.

	"Handle redirect if needed"
	(self allowRedirect and:[response isRedirect]) ifTrue:[
		"Eat up the content of the previous response"
		response content.
		repeatRedirect := self redirect: request from: response.
	].
	repeatRedirect] whileTrue:[
		"When redirecting, remove authentication headers"
		request removeHeader: 'Authorization'.
		request removeHeader: 'Proxy-Authorization'.
	].

	"If the response is not a success, eat up its content"
	(response isSuccess or:[response isInformational]) ifFalse:[response content].

	^response