testing
testHeaderFrame
	| header frame array| 
	header := H2HeaderTests standardHeader.
	frame := (H2HeadersFrame fromData: 
		(header encode: H2HPACKIndexTable new) andPaddingLength: 5)
		streamIdentifier: 13;
		flagPriority:0;
		yourself.
	array := self class encodedHeadersFrames third.
	self assert: (frame encode) equals: array.
	frame := H2HeadersFrame getFrameFrom: array.
	self assert: (H2Header newFrom: (frame payload) in: H2HPACKIndexTable new) 		equals: header