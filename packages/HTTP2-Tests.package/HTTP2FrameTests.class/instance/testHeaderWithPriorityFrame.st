testing
testHeaderWithPriorityFrame
	| header frame array| 
	header := HTTP2HeaderTests standardHeader.
	frame := (HTTP2HeadersFrame fromData: 
		(header encode: HTTP2HPACKIndexTable new) andPaddingLength: 5)
		flagPriority: 1;
		exclusiveBit: 1;
		streamDependency: 7;
		streamIdentifier: 13;
		weight: 8;
		yourself.
	array := self class encodedHeadersFrames first.
	self assert: (frame encode) equals: array.
	frame := HTTP2Frame getFrameFrom: array.
	self assert: (frame streamDependency ) equals: 7.
	self assert: (frame weight) equals: 8.
	self assert: (HTTP2Header newFrom: (frame payload) in: HTTP2HPACKIndexTable new) 		equals: header