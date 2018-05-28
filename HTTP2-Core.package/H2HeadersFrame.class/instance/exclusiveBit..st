accessing
exclusiveBit: aBit
	self hasPriorityFlag ifTrue: [ exclusiveBit := aBit ] 
