sending
nextFrame: maxPayloadSize
	| frame |
	frame := self sender nextFrame: (maxPayloadSize min: self flowControlWindow).
	self updateWindowSize: (frame size - H2Frame headerLength) negated.
	^ frame