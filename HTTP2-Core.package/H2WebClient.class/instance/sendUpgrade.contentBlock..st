accessing
sendUpgrade: request contentBlock: contentBlock
	
	| response |
		
	request addHeader: 'Connection' value: 'Upgrade,HTTP2-Settings'.
	request addHeader: 'Upgrade' value: 'h2c'.
	request addHeader: 'HTTP2-Settings' value: 'AAMAAABkAARAAAAAAAIAAAAA'.	
	self writeRequest: request on: stream.
	contentBlock value: stream.
	response := request newResponse readFrom: stream.
	response code = 101 
	ifTrue: [
	self serverProtocolDictionary  at: self serverName put: #h2c.
		response :=  self h2Session newH2WebResponseFor: self h2Session receive ]
	ifFalse: [
		self serverProtocolDictionary at: self serverName put: 'http/1.1' asSymbol ].
	
	^ response