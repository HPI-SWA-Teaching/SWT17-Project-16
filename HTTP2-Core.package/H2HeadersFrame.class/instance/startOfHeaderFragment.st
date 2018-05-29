accessing
startOfHeaderFragment
	self hasPriorityFlag ifTrue: [^ self startOfWeight + 1].
	^ self startOfPaddedPayload