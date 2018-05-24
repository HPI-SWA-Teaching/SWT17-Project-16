accessing
exclusiveBit: aBit
	self flagPrioritySet ifTrue: [ exclusiveBit := aBit ] 
