testing
testDataFrameFromPayloadAndPadding
	| header frame array | 
	header := HTTP2HeaderTests standardHeader.
	frame := HTTP2DataFrame fromData: 
		(header encode: HTTP2HPACKIndexTable new) andPaddingLength: 5.
	frame streamIdentifier: 13.
	array := self class encodedDataFrames first.
	self assert: (frame encode) equals: array.
	frame := HTTP2Frame getFrameFrom: array.
	self assert: (HTTP2Header newFrom: (frame payload) in: HTTP2HPACKIndexTable new) 		equals: header