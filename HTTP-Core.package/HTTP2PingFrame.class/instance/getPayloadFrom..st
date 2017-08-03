decoding
getPayloadFrom: aByteArray
	self opaqueData: (self getIntegerFrom: aByteArray from: self startOfPayload to: self endPoint).
	