sending
sendPriorKnowlege: aRequest contentBlock: aContentBlock

	(self isHttp2: self serverName  )
		ifTrue: [
			^  self h2Session newH2WebResponseFor: (self h2Session send: ( self convertToH2Request: aRequest with: aContentBlock)).].
	(self isHttp: self serverName  ) ifTrue: [
			self writeRequest: aRequest on: stream.
			aContentBlock value: stream.
			^ aRequest newResponse readFrom: stream].