accessing
sendPriorKnowlege: aRequest contentBlock: aContentBlock
	| protocol |
	protocol := (self serverProtocolDictionary at: self serverName).
	(protocol = #h2   or: [ protocol = #h2c ]) 
		ifTrue: [
			^  self h2Session newH2WebResponseFor: (self h2Session send: ( self convertToH2Request: aRequest with: aContentBlock)).]
		ifFalse: [
			self writeRequest: aRequest on: stream.
			aContentBlock value: stream.
			^ aRequest newResponse readFrom: stream.].