testing
testRstStreamFrame
	| frame array | 
	frame := HTTP2RstStreamFrame new
		streamIdentifier: 13;
		errorCode: 42;
		yourself.
	array := self class encodedStandardFrame: 3.
	self assert: (frame encode) equals: array.
	frame := HTTP2Frame getFrameFrom: array.
	self assert: (frame errorCode ) equals: 42