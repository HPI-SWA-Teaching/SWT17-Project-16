encoding
constructPayload 
	| payload |
	payload := self payload.
	self hasPriorityFlag ifTrue: [
		payload := 
			self streamDependencyBytes, 
			(ByteArray with: self weight), 
			payload].
	^ payload 