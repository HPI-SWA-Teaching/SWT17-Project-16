sending
setEndFlagsFor: aFrame
	self stream byteStreamOut atEnd ifTrue: [aFrame flagEndHeaders: 1].
	self stream request data = '' ifTrue: [aFrame flagEndStream: 1]