encoding
constructPayload 
	| payload |
	payload := self payload.
	self flagPriority ifTrue: [
		payload := 
			self streamDependencyBytes, 
			(ByteArray with: self weight), 
			payload].
	^ payload 