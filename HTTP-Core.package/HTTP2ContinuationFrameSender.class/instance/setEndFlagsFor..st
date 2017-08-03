sending
setEndFlagsFor: aFrame
	self stream byteStreamOut atEnd ifTrue: [aFrame flagEndHeaders: 1]