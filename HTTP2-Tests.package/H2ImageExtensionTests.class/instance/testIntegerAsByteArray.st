testing
testIntegerAsByteArray
	self assert: 0 asByteArray equals: #[0].
	self assert: 255 asByteArray equals: #[255].
	self assert: (1 bitShift: 8) asByteArray equals: #[1 0].
	self assert: (1 bitShift: 16) asByteArray equals: #[1 0 0].
	self assert: (1 bitShift: 24) asByteArray equals: #[1 0 0 0].
	self assert: ((1 bitShift: 32) - 1) asByteArray equals: #[255 255 255 255].
	self assert: (1 bitShift: 32) asByteArray equals: #[1 0 0 0 0].