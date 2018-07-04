accessing
sendUpgrade: aRequest contentBlock: aContentBlock
	
	| response |
		
	aRequest addHeader: 'Connection' value: 'Upgrade,HTTP2-Settings'.
	aRequest addHeader: 'Upgrade' value: 'h2c'.
	aRequest addHeader: 'HTTP2-Settings' value: 'AAMAAABkAARAAAAAAAIAAAAA'.	
	self writeRequest: aRequest on: stream.
	aContentBlock value: stream.
	response := aRequest newResponse readFrom: stream.
	response code = 101 
	ifTrue: [
		self protocol: #h2c for: self serverName .
		response :=  self h2Session newH2WebResponseFor: self h2Session receive ]
	ifFalse: [
		self protocol: 'http/1.1' asSymbol  for: self serverName].	
	^ response