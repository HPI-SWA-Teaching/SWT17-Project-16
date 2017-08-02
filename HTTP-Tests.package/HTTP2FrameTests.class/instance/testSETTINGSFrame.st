testing
testSETTINGSFrame
	| frame parameterList |
	parameterList := OrderedCollection new.
	parameterList 
		add: ('HeaderTableSize'->42);
		add: ('MaxConcurrentStreams'->4). 
	frame := HTTP2SettingsFrame fromParameters: parameterList.
	frame streamIdentifier: 13.
	self assert: (frame encode) equals: #[16r0 16r0 16r0c 16r04 16r00 16r00 16r00 16r00 16r00 16r00 16r01 16r0 16r0 16r0 16r2a 16r0 16r3 16r0 16r0 16r0 16r4 ].
	frame flagAck: 1.
	frame add: ('MaxHeaderListSize'->7).
	self assert: (frame encode) equals: #[16r0 16r0 16r12 16r04 16r01 16r00 16r00 16r00 16r00 16r00 16r01 16r0 16r0 16r0 16r2a 16r0 16r3 16r0 16r0 16r0 16r4 16r0 16r06 16r0 16r0 16r0 16r07].
	frame := HTTP2Frame getFrameFrom: #[16r0 16r0 16r12 16r04 16r01 16r00 16r00 16r00 16r00 16r00 16r01 16r0 16r0 16r0 16r2a 16r0 16r3 16r0 16r0 16r0 16r4 16r0 16r06 16r0 16r0 16r0 16r07].
	self assert: frame parameterList equals: parameterList.
	