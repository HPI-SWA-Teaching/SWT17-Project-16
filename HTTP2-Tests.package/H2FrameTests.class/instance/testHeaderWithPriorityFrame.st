testing
testHeaderWithPriorityFrame
	| header frame array| 
	header := H2HeaderTests standardHeader.
	frame := (H2HeadersFrame fromData: 
		(header encode: H2HPACKIndexTable new) andPaddingLength: 5)
		setPriorityFlag: true;
		exclusiveBit: 1;
		streamDependency: 7;
		streamIdentifier: 13;
		weight: 8;
		yourself.
	array := self class encodedHeadersFrames first.
	self assert: (frame encode) equals: array.
	frame := H2Frame getFrameFrom: array.
	self assert: (frame streamDependency ) equals: 7.
	self assert: (frame weight) equals: 8.
	self assert: (H2Header newFrom: (frame payload) in: H2HPACKIndexTable new) 		equals: header