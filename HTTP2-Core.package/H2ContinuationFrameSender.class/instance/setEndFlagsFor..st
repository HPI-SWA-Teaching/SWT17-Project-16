sending
setEndFlagsFor: aFrame
	self stream outStreamEnded ifTrue: [aFrame flags endHeaders: true]