accessing
exclusiveBit: aBit
	self flags priority ifTrue: [ exclusiveBit := aBit ]