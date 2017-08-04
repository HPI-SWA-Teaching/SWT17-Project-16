decoding
readRemainingPayloadFrom: aByteArray withOffset: offset
	self readStreamDependencyFrom: aByteArray withOffset: offset.
	self weight: (aByteArray at: 14 + offset).
	self payload: (aByteArray copyFrom: 15 + offset to: self endPoint)