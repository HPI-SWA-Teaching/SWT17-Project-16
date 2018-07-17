sending
sendPriorKnowledge: aRequest contentBlock: aContentBlock

	(self knownAsHttp2: self serverName)
		ifTrue: [^ self sendHttp2: aRequest contentBlock: aContentBlock].
	(self knownAsHttp: self serverName)
		ifTrue: [^ self sendHttp: aRequest contentBlock: aContentBlock].
	H2Error signal: 'unknown server protocol'