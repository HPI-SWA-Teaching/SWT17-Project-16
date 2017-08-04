sending
setEndFlagsFor: aFrame
	self stream outStreamEnded ifTrue: [aFrame flagEndHeaders: 1]