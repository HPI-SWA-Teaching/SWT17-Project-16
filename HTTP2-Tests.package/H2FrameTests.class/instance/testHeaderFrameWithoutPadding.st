testing
testHeaderFrameWithoutPadding
	| header frame array| 
	header := H2HeaderTests standardHeader.
	frame := self class standardHeadersFrameFor: 
		(header encode: H2HPACKIndexTable new).
	array := self class encodedHeadersFrames second.
	self assert: (frame encode) equals: array.
	frame := H2HeadersFrame getFrameFrom: array.
	self assert: (H2Header newFrom: (frame payload) in: H2HPACKIndexTable new) 		equals: header