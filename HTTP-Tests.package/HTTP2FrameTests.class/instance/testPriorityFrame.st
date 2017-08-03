testing
testPriorityFrame
	| frame array | 
	frame := HTTP2PriorityFrame new.
	frame streamIdentifier: 13.
	frame exclusiveBit: 1.
	frame streamDependency: 7.
	frame weight: 8.
	array := #[16r0 16r0 16r05 16r02 16r00 16r0 16r0 16r0 16r0d 16r80 16r00 16r00 16r07 16r08 ].
	self assert: (frame encode) equals: array.
	frame := HTTP2Frame getFrameFrom: array.
	self assert: (frame streamIdentifier ) equals: 13.
	self assert: (frame exclusiveBit) equals:1.
	self assert: (frame streamDependency ) equals: 7.
	self assert: (frame weight) equals: 8.  
	