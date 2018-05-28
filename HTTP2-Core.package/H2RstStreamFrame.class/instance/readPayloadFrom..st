decoding
readPayloadFrom: aByteArray
	self errorCode: (aByteArray copyFrom: self class startOfPayload to: self endOfPayload) asInteger