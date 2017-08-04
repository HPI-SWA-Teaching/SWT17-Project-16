encoding
streamDependencyBytes
	^ self integer: (self streamDependency bitAt: 32 put: (self exclusiveBit)) asByteArrayOfSize: 4 
		