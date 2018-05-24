accessing
startOfHeaderFragment
	^ self flagPrioritySet ifTrue: [self startOfWeight + 1] ifFalse: [self class startOfPayload + self flagPadded]
		