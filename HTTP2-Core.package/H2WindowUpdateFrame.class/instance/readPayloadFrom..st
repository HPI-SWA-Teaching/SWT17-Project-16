decoding
readPayloadFrom: aByteArray
	self increment: (aByteArray copyFrom: self class startOfPayload to: self endOfPayload) asInteger