accessing
endOfPayload
	^ self flagPaddedSet 
		ifTrue: [super endOfPayload - (self padding size - 1)]
		ifFalse: [super endOfPayload]
	