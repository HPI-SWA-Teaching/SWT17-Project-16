testing
testSettingsFrame
	| frame parameterList encodedFrames |
	parameterList := OrderedCollection new.
	parameterList 
		add: ('HeaderTableSize'->42);
		add: ('MaxConcurrentStreams'->4). 
	frame := H2SettingsFrame fromParameters: parameterList.
	frame streamIdentifier: 13.
	encodedFrames := self class encodedSettingsFrames.
	self assert: (frame encode) equals: encodedFrames first.
	frame flags ack: true.
	frame add: ('MaxHeaderListSize'->7).
	self assert: (frame encode) equals: encodedFrames second.
	frame := H2Frame getFrameFrom: encodedFrames second.
	self assert: frame parameterList equals: parameterList