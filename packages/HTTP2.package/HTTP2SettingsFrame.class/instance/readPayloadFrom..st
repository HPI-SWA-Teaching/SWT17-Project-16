decoding
readPayloadFrom: aByteArray
	self payload: (aByteArray copyFrom: self class startOfPayload to: aByteArray size).
	self decodeParameterList