encoding
constructPayload 
	| payload |
	payload := self payload.
	self flags priority ifTrue: [
		payload := 
			self streamDependencyBytes, 
			(ByteArray with: self weight), 
			payload].
	^ payload 