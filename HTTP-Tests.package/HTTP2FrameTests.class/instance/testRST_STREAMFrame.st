testing
testRST_STREAMFrame
	| frame array | 
	frame := HTTP2RstStreamFrame new.
	frame streamIdentifier: 13.
	frame errorCode: 42.
	array := #[16r0 16r0 16r04 16r03 16r00 16r0 16r0 16r0 16r0d 16r00 16r00 16r00 16r2a ].
	self assert: (frame encode) equals: array.
	frame := HTTP2Frame getFrameFrom: array.
	self assert: (frame errorCode ) equals: 42.
	