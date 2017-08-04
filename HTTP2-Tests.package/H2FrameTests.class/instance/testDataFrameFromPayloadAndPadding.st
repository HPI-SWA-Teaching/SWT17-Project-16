testing
testDataFrameFromPayloadAndPadding
	| header frame array | 
	header := H2HeaderTests standardHeader.
	frame := H2DataFrame fromData: 
		(header encode: H2HPACKIndexTable new) andPaddingLength: 5.
	frame streamIdentifier: 13.
	array := self class encodedDataFrames first.
	self assert: (frame encode) equals: array.
	frame := H2Frame getFrameFrom: array.
	self assert: (H2Header newFrom: (frame payload) in: H2HPACKIndexTable new) 		equals: header