accessing
optPaddedOffset
	self hasPaddedFlag ifTrue: [^ self class paddedOffset].
	^ 0