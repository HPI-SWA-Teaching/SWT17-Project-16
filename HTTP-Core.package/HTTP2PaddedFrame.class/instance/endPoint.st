accessing
endPoint
	self flagPaddedSet ifTrue: [^ (self length- (self padding size-1) + 9)]
	 ifFalse: [ ^ self length +9]
	