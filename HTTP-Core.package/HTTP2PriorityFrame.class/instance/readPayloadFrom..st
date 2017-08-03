accessing
readPayloadFrom: aByteArray
	self streamDependency: (self getIntegerFrom: aByteArray from: self class startOfPayload to: 13).
	self exclusiveBit: (self streamDependency bitAt: 32).
	self streamDependency: (self streamDependency bitAt: 32 put: 0).
	self weight: (aByteArray at: self endPoint)
	