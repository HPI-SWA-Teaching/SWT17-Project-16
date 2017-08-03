as yet unclassified
constructPayload 
^ (self integer: (self streamDependency bitAt: 32 put: (self E)) asByteArrayOfSize: 4), 
		(self integer: (self weight) asByteArrayOfSize: 1).