decoding
readPayloadFrom: aByteArray
	| startPoint  |
	self flagPaddedSet ifTrue: [
		startPoint := self length - (aByteArray at: self class startOfPayload) + self class headerLength. 
		self padding: (self getIntegerFrom: aByteArray from: startPoint to: super endPoint)]