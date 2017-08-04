testing
testPingFrame 
	| frame array|
	frame := HTTP2PingFrame fromOpaqueData: 42.
	frame streamIdentifier: 13.
	self assert: (frame encode) equals: self class encodedPingFrame.
	array := self class encodedPingFrame.
	frame := HTTP2Frame getFrameFrom: array.
	self assert: frame opaqueData equals: 42