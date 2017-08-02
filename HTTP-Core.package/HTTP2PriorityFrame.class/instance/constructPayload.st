as yet unclassified
constructPayload 
^ ((self streamDependency bitAt: 32 put: (self E)) asByteArrayOfSize: 4), 
		((self weight) asByteArrayOfSize: 1).