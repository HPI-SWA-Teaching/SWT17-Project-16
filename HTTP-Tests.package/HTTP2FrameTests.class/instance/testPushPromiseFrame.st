testing
testPushPromiseFrame
	| header frame array | 
	header := HTTP2HeaderTests standardHeader.
	frame := (HTTP2PushPromiseFrame fromData: 
		(header encode: HTTP2HPACKIndexTable new) andPaddingLength: 5)
		streamIdentifier: 13;
		promisedID: 7;
		flagEndHeaders: 1;
		yourself.
	array := self class encodedPushPromisFrame.
	self assert: (frame encode) equals: array.
	frame := HTTP2Frame getFrameFrom: array.
	self assert: frame promisedID  equals: 7.
	self assert: (HTTP2Header newFrom: (frame payload) in: HTTP2HPACKIndexTable new) 		equals: header