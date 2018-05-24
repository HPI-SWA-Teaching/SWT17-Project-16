decoding
readPayloadFrom: aByteArray
	super readPayloadFrom: aByteArray.
	self payload: (aByteArray copyFrom: self class startOfPayload + self flagPadded to: self endOfPayload)
	
	