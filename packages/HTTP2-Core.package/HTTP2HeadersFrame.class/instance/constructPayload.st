as yet unclassified
constructPayload 
	| payload |
	payload := self payload.
	self flagPriority ifTrue: [ payload := 
		((self streamDependency bitAt: 32 put: (self E)) asByteArrayOfSize: 4), 
		((self weight) asByteArrayOfSize: 1), 
		payload].
	^ payload 