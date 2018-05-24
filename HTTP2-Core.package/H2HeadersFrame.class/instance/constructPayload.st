encoding
constructPayload 
	| payload |
	payload := self payload.
	self flagPrioritySet ifTrue: [
		payload := 
			self streamDependencyBytes, 
			(ByteArray with: self weight), 
			payload].
	^ payload 