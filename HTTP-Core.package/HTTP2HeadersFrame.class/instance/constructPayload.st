as yet unclassified
constructPayload 
	| payload |
	payload := self payload.
	self flagPriority ifTrue: [ payload := 
		(self integer: (self streamDependency bitAt: 32 put: (self E)) asByteArrayOfSize: 4), 
		(self integer: (self weight) asByteArrayOfSize: 1), 
		payload].
	^ payload 