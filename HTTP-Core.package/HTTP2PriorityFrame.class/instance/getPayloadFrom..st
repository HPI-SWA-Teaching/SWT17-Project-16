accessing
getPayloadFrom: aByteArray
	self streamDependency: (self getIntegerFrom: aByteArray from: self startOfPayload to: 13).
	self E: (self streamDependency bitAt: 32).
	self streamDependency: (self streamDependency bitAt: 32 put: 0).
	self weight: (self getIntegerFrom: aByteArray from: self endPoint to: self endPoint).
	