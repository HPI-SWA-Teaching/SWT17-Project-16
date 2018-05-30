decoding
readPriorityValuesFrom: aByteArray
	self streamDependency: (aByteArray copyFrom: self startOfStreamDependency to: self startOfStreamDependency + 3) asPositiveBigEndianInteger.
	self exclusive: (self streamDependency bitAt: 32) = 1.
	self streamDependency: (self streamDependency bitAt: 32 put: 0).
	self weight: (aByteArray at: self startOfWeight)