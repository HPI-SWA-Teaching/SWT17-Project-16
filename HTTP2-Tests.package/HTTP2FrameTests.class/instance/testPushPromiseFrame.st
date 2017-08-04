testing
testPushPromiseFrame
	| header frame array | 
	header := HTTP2HeaderTests standardHeader.
	frame := (H2PushPromiseFrame fromData: 
		(header encode: H2HPACKIndexTable new) andPaddingLength: 5)
		streamIdentifier: 13;
		promisedID: 7;
		flagEndHeaders: 1;
		yourself.
	array := self class encodedPushPromisFrame.
	self assert: (frame encode) equals: array.
	frame := H2Frame getFrameFrom: array.
	self assert: frame promisedID  equals: 7.
	self assert: (H2Header newFrom: (frame payload) in: H2HPACKIndexTable new) 		equals: header