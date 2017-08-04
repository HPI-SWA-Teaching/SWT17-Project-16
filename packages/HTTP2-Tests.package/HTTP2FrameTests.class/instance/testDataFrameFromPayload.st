testing
testDataFrameFromPayload
	| header frame array| 
	header := HTTP2HeaderTests standardHeader.
	frame := HTTP2DataFrame fromPayload: (header encode: HTTP2HPACKIndexTable new).
	frame streamIdentifier: 13.
	array := self class encodedDataFrames second.
	self assert: (frame encode) equals: array.
	frame := HTTP2Frame getFrameFrom: array.
	self assert: (frame streamIdentifier) equals: 13.
	self assert: (HTTP2Header newFrom: (frame payload) in: HTTP2HPACKIndexTable new) 		equals: header