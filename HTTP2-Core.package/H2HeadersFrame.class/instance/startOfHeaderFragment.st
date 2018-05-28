accessing
startOfHeaderFragment
	^ self hasPriorityFlag
		ifTrue: [self startOfWeight + 1]
		ifFalse: [self class startOfPayload + self hasPaddedFlag integerRepesentation]
		