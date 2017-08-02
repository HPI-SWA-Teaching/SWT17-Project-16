as yet unclassified
setEndFlagsFor: aStream
	aStream headerStreamOut atEnd ifTrue: [
		self flagEndHeaders: 1].
	aStream dataStreamOut atEnd ifTrue: [
		self flagEndStream: 1].