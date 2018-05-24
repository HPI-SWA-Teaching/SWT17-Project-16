decoding
readPriorityValuesFrom: aByteArray
	self streamDependency: (self getIntegerFrom: aByteArray from: self startOfStreamDependency to: self startOfStreamDependency + 3).
	self exclusiveBit: (self streamDependency bitAt: 32).
	self streamDependency: (self streamDependency bitAt: 32 put: 0).
	self weight: (aByteArray at: self startOfWeight)