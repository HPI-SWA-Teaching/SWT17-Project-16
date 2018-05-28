sending
setEndFlagsFor: aFrame
	self stream outStreamEnded ifTrue: [aFrame setEndHeadersFlag: true].
	self stream request data = '' ifTrue: [aFrame setEndStreamFlag: true]