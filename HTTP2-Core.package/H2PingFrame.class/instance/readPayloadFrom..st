decoding
readPayloadFrom: aByteArray
	self opaqueData: (self getIntegerFrom: aByteArray from: self class startOfPayload to: self endOfPayload)
	