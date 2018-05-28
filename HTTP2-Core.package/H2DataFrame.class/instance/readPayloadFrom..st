decoding
readPayloadFrom: aByteArray
	super readPayloadFrom: aByteArray.
	self payload: (aByteArray copyFrom: (self class startOfPayload + self hasPaddedFlag integerRepesentation) to: self endOfPayload)
	