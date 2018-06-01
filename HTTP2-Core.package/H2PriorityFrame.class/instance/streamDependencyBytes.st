encoding
streamDependencyBytes 
	^ (self streamDependency bitAt: 32 put: (self exclusive asBit)) asByteArrayOfSize: 4