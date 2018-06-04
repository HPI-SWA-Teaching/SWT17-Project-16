decoding
readPayloadFrom: aByteArray
	self payload: (aByteArray copyFrom: self class startOfPayload to: self endOfPayload).
	self decodeParameterList