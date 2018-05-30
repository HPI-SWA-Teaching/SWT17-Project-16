accessing
endOfPayload
	self hasPaddedFlag ifTrue: [^ super endOfPayload - (self padding size - 1)].
	^ super endOfPayload