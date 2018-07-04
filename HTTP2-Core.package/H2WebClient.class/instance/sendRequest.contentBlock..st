accessing
sendRequest: aRequest contentBlock: aContentBlock
	| response repeatRedirect repeatAuth |

	redirections := Dictionary new.
	
	[repeatRedirect := false.
		aRequest headerAt: 'Host' put: server.
		[
			repeatAuth := false.
			self connect ifNotNil:[:resp| ^resp].
			debugLog ifNotNil:[self writeRequest: aRequest on: debugLog].
	
			(self serverProtocolDictionary includesKey: self serverName)
				ifFalse: [ response := self sendUpgrade: aRequest  contentBlock: aContentBlock ] 
				ifTrue: [ response := self sendPriorKnowlege: aRequest  contentBlock: aContentBlock ].
			
			response url: (scheme, '://', server, aRequest rawUrl).
			
			debugLog ifNotNil:[
				response writeOn: debugLog.
				debugLog flush.].
			response setCookiesDo:[:cookie| self acceptCookie: cookie host: self serverUrlName path: aRequest url.].
			accessLog ifNotNil:[
				WebUtils logRequest: aRequest response: response on: accessLog].
			
			(self allowAuth and:[response code = 401 or:[response code = 407]]) ifTrue:[
				response content.
				repeatAuth := self authenticate: aRequest from: response.].

			repeatAuth ] whileTrue.
	
		self flushAuthState.
		(self allowRedirect and:[response isRedirect]) ifTrue:[
			response content.
			repeatRedirect := self redirect: aRequest from: response.].
			repeatRedirect ] whileTrue:[
				aRequest removeHeader: 'Authorization'.
				aRequest removeHeader: 'Proxy-Authorization'.].

	(response isSuccess or:[response isInformational]) ifFalse:[response content].

	^response