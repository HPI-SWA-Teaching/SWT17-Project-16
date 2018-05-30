accessing
optPaddedOffset
	self flags padded ifTrue: [^ self class paddedOffset].
	^ 0