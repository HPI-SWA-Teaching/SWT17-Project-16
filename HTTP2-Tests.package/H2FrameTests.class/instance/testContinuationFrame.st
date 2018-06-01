testing
testContinuationFrame
	| header frame array | 
	header := H2HeaderTests standardHeader.
	frame := (H2ContinuationFrame fromPayload: 
		(header encode: H2HPACKIndexTable new))
		streamIdentifier: 13;
		yourself.
	frame flags endHeaders: true.
	
	array := self class encodedContinuationFrame.
	self assert: (frame encode) equals: array.
	frame := H2Frame getFrameFrom: array.
	self assert: frame flags endHeaders.
	self assert: (frame streamIdentifier) equals: 13