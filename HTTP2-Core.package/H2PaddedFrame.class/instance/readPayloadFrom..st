decoding
readPayloadFrom: aByteArray
	| startPoint  |
	self flagPaddedSet ifTrue: [
		startPoint := self length - 
			(aByteArray at: self class startOfPayload) + self class headerLength. 
		self padding: (aByteArray copyFrom: startPoint to: super endPoint)]