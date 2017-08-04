testing
testPriorityFrame
	| frame array | 
	frame := self class standardPriorityFrame.
	array := self class encodedPriorityFrame.
	self assert: (frame encode) equals: array.
	frame := H2Frame getFrameFrom: array.
	self assert: (frame streamIdentifier ) equals: 13.
	self assert: (frame exclusiveBit) equals:1.
	self assert: (frame streamDependency ) equals: 7.
	self assert: (frame weight) equals: 8