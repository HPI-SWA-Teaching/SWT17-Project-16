testing
testHeaderFrameWithoutPadding
	| header frame array| 
	header := HTTP2HeaderTests standardHeader.
	frame := self class standardHeadersFrameFor: 
		(header encode: HTTP2HPACKIndexTable new).
	array := self class encodedHeadersFrames second.
	self assert: (frame encode) equals: array.
	frame := HTTP2HeadersFrame getFrameFrom: array.
	self assert: (HTTP2Header newFrom: (frame payload) in: HTTP2HPACKIndexTable new) 		equals: header