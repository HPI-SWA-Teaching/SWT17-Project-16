as yet unclassified
nextFrame: maxPayloadSize
	| frame |
	frame := self frameType new
		streamIdentifier: self stream id;
		payload: (self stream byteStreamOut next: maxPayloadSize);
		yourself.
	self setEndFlagsFor: frame.
	self transition.
	^ frame encode