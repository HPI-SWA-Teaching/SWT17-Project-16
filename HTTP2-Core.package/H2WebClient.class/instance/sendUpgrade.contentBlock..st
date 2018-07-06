sending
sendUpgrade: aRequest contentBlock: aContentBlock
	| response |
	
	self class upgradeHeaders do: [:header |
		aRequest addHeader: header key value: header value].
	
	self writeRequest: aRequest on: stream.
	aContentBlock value: stream.
	response := aRequest newResponse readFrom: stream.
	
	"if server sends switchingPorotcols we can upgrade, otherwise it does not understand the upgrade request"
	(self isSwitchingProtocols: response)
		ifTrue: [	self registerAsHttp2: self serverName.
			^ self h2Session newH2WebResponseFor: self h2Session receive]
		ifFalse: [self registerAsHttp: self serverName.
			^ response]