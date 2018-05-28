decoding
readPayloadFrom: aByteArray
	self errorCode: (Integer from: (aByteArray copyFrom: self class startOfPayload to: self endOfPayload))