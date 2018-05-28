decoding
readPayloadFrom: aByteArray
	self increment: (Integer from: (aByteArray copyFrom: self class startOfPayload to: self endOfPayload))