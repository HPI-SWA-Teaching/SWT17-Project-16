accessing
endOfPayload
	self flags padded ifTrue: [^ super endOfPayload - (self padding size - 1)].
	^ super endOfPayload