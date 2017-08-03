decoding
getPayloadFrom: aByteArray
	self increment: (self getIntegerFrom: aByteArray from: self startOfPayload to: self endPoint).