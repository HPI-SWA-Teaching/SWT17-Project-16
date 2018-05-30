accessing
startOfHeaderFragment
	self flags priority ifTrue: [^ self startOfWeight + 1].
	^ self startOfPaddedPayload