testing
testPingFrame 
	| frame array|
	frame := H2PingFrame fromOpaqueData: 42.
	frame streamIdentifier: 13.
	self assert: (frame encode) equals: self class encodedPingFrame.
	array := self class encodedPingFrame.
	frame := H2Frame getFrameFrom: array.
	self assert: frame opaqueData equals: 42