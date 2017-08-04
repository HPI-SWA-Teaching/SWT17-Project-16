sending
setEndFlagsFor: aFrame
	self stream outStreamEnded ifTrue: [aFrame flagEndHeaders: 1].
	self stream request data = '' ifTrue: [aFrame flagEndStream: 1]