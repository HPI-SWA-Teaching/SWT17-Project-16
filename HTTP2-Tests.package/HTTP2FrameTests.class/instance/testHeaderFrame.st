testing
testHeaderFrame
	| header frame array| 
	header := HTTP2HeaderTests standardHeader.
	frame := (HTTP2HeadersFrame fromData: 
		(header encode: HTTP2HPACKIndexTable new) andPaddingLength: 5)
		streamIdentifier: 13;
		flagPriority:0;
		yourself.
	array := self class encodedHeadersFrames third.
	self assert: (frame encode) equals: array.
	frame := HTTP2HeadersFrame getFrameFrom: array.
	self assert: (HTTP2Header newFrom: (frame payload) in: HTTP2HPACKIndexTable new) 		equals: header