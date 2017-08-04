sending
setEndFlagsFor: aFrame
	self stream outStreamEnded ifTrue: [aFrame flagEndStream: 1]