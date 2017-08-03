encoding
constructPayload 
^ (self integer: (self streamDependency bitAt: 32 put: (self exclusiveBit)) asByteArrayOfSize: 4), 
		(self integer: (self weight) asByteArrayOfSize: 1).