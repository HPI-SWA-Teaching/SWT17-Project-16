accessing
weight: anObject
" In RFC: Add one to the value to obtain a weight between 1 and 256."
	self flagPriority ifTrue: [weight := anObject] 