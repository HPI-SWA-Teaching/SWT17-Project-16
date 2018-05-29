accessing
optPaddedOffset
	self hasPaddedFlag ifTrue: [^ self class optPaddedOffset].
	^ 0