decoding
readPayloadFrom: aByteArray
	self opaqueData: (Integer from: (aByteArray copyFrom: self class startOfPayload to: self endOfPayload))
	