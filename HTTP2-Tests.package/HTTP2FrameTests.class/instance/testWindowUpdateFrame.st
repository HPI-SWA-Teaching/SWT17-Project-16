testing
testWindowUpdateFrame 
	| frame array |
	frame := H2WindowUpdateFrame new
		streamIdentifier: 13;
		increment: 42;
		yourself.
	array :=  self class encodedStandardFrame: 8.
	self assert: (frame encode) equals: array.
	frame := H2Frame getFrameFrom: array.
	self assert: (frame increment) equals: 42