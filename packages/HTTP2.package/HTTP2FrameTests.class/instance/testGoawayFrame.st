testing
testGoawayFrame 
	| frame array |
	frame := HTTP2GoawayFrame new
		streamIdentifier: 13;
		lastID: 13;
		errorCode: 42;
		debugData: #(42 0 13);
		yourself.
	array:= self class encodedGoawayFrame.
	self assert: (frame encode) equals: array.
	frame := HTTP2Frame getFrameFrom: array.
	self assert: (frame lastID ) equals: 13. 
	self assert: (frame errorCode ) equals: 42.
	self assert: (frame debugData) equals:  #(42 0 13)