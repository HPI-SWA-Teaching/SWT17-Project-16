testing
testDataFrameFromPayload
	| header frame array| 
	header := HTTP2HeaderTests standardHeader.
	frame := H2DataFrame fromPayload: (header encode: H2HPACKIndexTable new).
	frame streamIdentifier: 13.
	array := self class encodedDataFrames second.
	self assert: (frame encode) equals: array.
	frame := H2Frame getFrameFrom: array.
	self assert: (frame streamIdentifier) equals: 13.
	self assert: (H2Header newFrom: (frame payload) in: H2HPACKIndexTable new) 		equals: header