decoding
getPayloadFrom: aByteArray
	self lastID: (self getIntegerFrom: aByteArray from: self startOfPayload to: 13).
	self errorCode: (self getIntegerFrom: aByteArray from: 14 to: 17).
	self debugData: ((aByteArray copyFrom: 18 to: self endPoint) asArray).
