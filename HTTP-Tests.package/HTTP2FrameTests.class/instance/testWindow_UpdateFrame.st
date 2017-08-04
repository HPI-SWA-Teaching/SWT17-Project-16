testing
testWindow_UpdateFrame 
	| frame array |
	frame := HTTP2WindowUpdateFrame new.
	frame streamIdentifier: 13.
	frame increment: 42.
	array :=  #[16r0 16r0 16r04 16r08 16r00 16r0 16r0 16r0 16r0d 16r0 16r0 16r0 16r2a].
	self assert: (frame encode) equals: array.
	frame := HTTP2Frame getFrameFrom: array.
	self assert: (frame increment) equals: 42. 
	