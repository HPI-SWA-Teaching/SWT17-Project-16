decoding
readPayloadFrom: aByteArray
	self increment: (self getIntegerFrom: aByteArray from: self class startOfPayload to: self endPoint)