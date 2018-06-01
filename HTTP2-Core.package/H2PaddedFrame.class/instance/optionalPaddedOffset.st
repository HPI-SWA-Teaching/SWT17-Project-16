accessing
optionalPaddedOffset
	self flags padded ifTrue: [^ self class paddedOffset].
	^ 0