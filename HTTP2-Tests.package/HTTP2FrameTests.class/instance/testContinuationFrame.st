testing
testContinuationFrame
	| header frame array | 
	header := HTTP2HeaderTests standardHeader.
	frame := (H2ContinuationFrame fromPayload: 
		(header encode: H2HPACKIndexTable new))
		streamIdentifier: 13;
		flagEndHeaders: 1;
		yourself.
	array := self class encodedContinuationFrame.
	self assert: (frame encode) equals: array.
	frame := H2Frame getFrameFrom: array.
	self assert: (frame flagEndHeaders ) equals: 1.
	self assert: (frame streamIdentifier ) equals: 13