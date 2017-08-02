testing
testGoawayFrame 
	| frame array |
	frame := HTTP2GoawayFrame new.
	frame streamIdentifier: 13.
	frame lastID: 13.
	frame errorCode: 42.
	frame debugData: #(42 0 13). 
	array:= #[16r0 16r0 16r0b 16r07 16r00 16r0 16r0 16r0 16r00 16r0 16r0 16r0 16r0d 16r0 16r0 16r0 16r2a 16r2a 16r0 16r0d].
	self assert: (frame encode) equals: array.
	frame := HTTP2Frame getFrameFrom: array.
	self assert: (frame lastID ) equals: 13. 
	self assert: (frame errorCode ) equals: 42.
	self assert: (frame debugData) equals:  #(42 0 13). 
	