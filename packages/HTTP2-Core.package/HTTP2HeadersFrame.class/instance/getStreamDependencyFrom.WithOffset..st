as yet unclassified
getStreamDependencyFrom: aByteArray WithOffset: offset
	self streamDependency: (self getIntegerFrom: aByteArray from: 10+offset to: 13+offset).
	self E: (self streamDependency bitAt: 32).
	self streamDependency: (self streamDependency bitAt: 32 put: 0)