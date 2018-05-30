sending
setEndFlagsFor: aFrame
	self stream outStreamEnded ifTrue: [aFrame flags endStream: true]