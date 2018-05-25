methods
h2cUpgradeRequest: anUrlString do: aBlock 
	| request  response |
	request := self requestH2CWithUrl: anUrlString.
	aBlock value: request.
	response := self sendRequest: request. 
	response code = 101 
		ifTrue: [
			self serverProtocolDictionary  at: self server put: #h2c.
			self h2Session:( H2Session newWithStream: response stream at: self serverName ).
			^ self h2Session receive ]
		ifFalse: [
			self serverProtocolDictionary at: self server put: #http.
			^ response. ].
			