decoding
readPayloadFrom: aByteArray
	self opaqueData: (aByteArray copyFrom: self class startOfPayload to: self endOfPayload) asPositiveBigEndianInteger
	