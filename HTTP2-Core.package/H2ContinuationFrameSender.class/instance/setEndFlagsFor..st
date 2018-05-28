sending
setEndFlagsFor: aFrame
	self stream outStreamEnded ifTrue: [aFrame setEndHeadersFlag: true]