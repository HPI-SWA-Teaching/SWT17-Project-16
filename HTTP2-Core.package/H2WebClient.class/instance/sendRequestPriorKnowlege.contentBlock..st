accessing
sendRequestPriorKnowlege: request contentBlock: contentBlock
	| protocol |
	protocol := (self serverProtocolDictionary at: self serverName).
	Transcript show: protocol; cr .
	protocol = #h2 ifTrue: [
			^  self h2Session newH2WebResponseFor: (self h2Session send: ( self h2Session newRequestFor: (self getPathFrom:  request url))).].
	protocol = #h2c ifTrue: [
			^  self h2Session newH2WebResponseFor: (self h2Session send: ( self h2Session newRequestFor: (self getPathFrom:  request url))).].
					
	protocol = 'http/1.1' asSymbol   ifTrue: [
						self writeRequest: request on: stream.
						contentBlock value: stream.

						^ request newResponse readFrom: stream.].