decoding
readPayloadFrom: aByteArray
	self errorCode: (self getIntegerFrom: aByteArray from: self class startOfPayload to: self endPoint)