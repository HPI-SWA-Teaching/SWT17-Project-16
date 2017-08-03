accessing
endPoint
	^ self flagPaddedSet 
		ifTrue: [self length - (self padding size - 1) + self class headerLength]
		ifFalse: [super endPoint]
	