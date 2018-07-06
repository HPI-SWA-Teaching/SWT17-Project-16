sending
sendPriorKnowlege: aRequest contentBlock: aContentBlock

	(self knownAsHttp2: self serverName)
		ifTrue: [^ self privateSendHttp2: aRequest contentBlock: aContentBlock].
	(self knownAsHttp: self serverName)
		ifTrue: [^ self privateSendHttp: aRequest contentBlock: aContentBlock].
	H2Error signal: 'unknown server protocol'