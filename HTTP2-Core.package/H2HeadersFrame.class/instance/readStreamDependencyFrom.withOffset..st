decoding
readStreamDependencyFrom: aByteArray withOffset: offset
	self streamDependency: (self getIntegerFrom: aByteArray from: self class startOfPayload + offset to: 13 + offset).
	self exclusiveBit: (self streamDependency bitAt: 32).
	self streamDependency: (self streamDependency bitAt: 32 put: 0)