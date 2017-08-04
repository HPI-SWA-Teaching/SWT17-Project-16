accessing
exclusiveBit: aBit
	self flagPriority ifTrue: [ exclusiveBit := aBit ] 
