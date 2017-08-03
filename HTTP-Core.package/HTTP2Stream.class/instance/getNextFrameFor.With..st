as yet unclassified
getNextFrameFor: aFrameClass With: maxPayload
	| frame byteArray |
	frame:= aFrameClass constructFor: self With: maxPayload.
	byteArray := frame encode.
	self updateWindowSize: (byteArray size - HTTP2Frame headerLength ) negated.
	^ byteArray