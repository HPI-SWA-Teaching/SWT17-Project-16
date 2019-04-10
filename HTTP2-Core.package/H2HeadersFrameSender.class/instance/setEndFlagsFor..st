sending
setEndFlagsFor: aFrame
	self stream outStreamEnded ifTrue: [aFrame flags endHeaders: true].
	self stream request data = '' ifTrue: [aFrame flags endStream: true]