as yet unclassified
getPayloadFrom: aByteArray
	self errorCode: (self getIntegerFrom: aByteArray from: self startOfPayload to: self endPoint).