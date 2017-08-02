testing
testContinuationFrame
	| header frame array | 
	header := HTTP2Header new.
	header 
		add: ':method'->'GET';
		add: ':scheme'->'http';
		add: ':path' ->'/';
		add: ':authority'->'www.example.com'.
	frame := HTTP2ContinuationFrame fromPayload: (header encode: (HTTP2HPACKIndexTable newWith: 1000)).
	frame streamIdentifier: 13.
	frame flagEndHeaders: 1.
	array := #[16r0 16r0 16r14 16r09 16r04 16r0 16r0 16r0 16r0d  16r82 16r86 16r84 16r41 16r0f 16r77 16r77 16r77 16r2e 16r65 16r78 16r61 16r6d 16r70 16r6c 16r65 16r2e 16r63 16r6f 16r6d].
	self assert: (frame encode) equals: array.
	
	frame := HTTP2Frame getFrameFrom: array.
	self assert: (frame flagEndHeaders ) equals: 1.
	self assert: (frame streamIdentifier ) equals: 13.
	