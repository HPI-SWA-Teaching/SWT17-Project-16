decoding
readPayloadFrom: aByteArray
	| startPoint  |
	self flagPaddedSet ifTrue: [
		startPoint := super endOfPayload - (aByteArray at: self class startOfPayload). 
		self padding: (aByteArray copyFrom: startPoint to: super endOfPayload)]