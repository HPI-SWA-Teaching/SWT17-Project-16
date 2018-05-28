sending
setEndFlagsFor: aFrame
	self stream outStreamEnded ifTrue: [aFrame setEndStreamFlag: true]