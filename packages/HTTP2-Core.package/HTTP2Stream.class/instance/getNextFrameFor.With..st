as yet unclassified
getNextFrameFor: aFrameClass With: maxPayload
	| frame byteArray |
	frame:= aFrameClass constructFor: self With: maxPayload.
	byteArray := frame encode.
	self updateWindowSize: (byteArray size - 9 ) negated.
	^ byteArray