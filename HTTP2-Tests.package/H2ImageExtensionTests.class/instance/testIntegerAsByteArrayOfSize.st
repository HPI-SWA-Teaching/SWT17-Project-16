testing
testIntegerAsByteArrayOfSize
	self should: [0 asByteArrayOfSize: 0] raise: Error.
	self assert: (0 asByteArrayOfSize: 1) equals: #[0].
	self assert: (0 asByteArrayOfSize: 2) equals: #[0 0].
	self assert: (0 asByteArrayOfSize: 4) equals: #[0 0 0 0].
	
	self assert: (255 asByteArrayOfSize: 1) equals: #[255].
	self assert: (255 asByteArrayOfSize: 3) equals: #[0 0 255].
	
	self should: [(1 bitShift: 24) asByteArrayOfSize: 3] raise: Error.
	self assert: ((1 bitShift: 24) asByteArrayOfSize: 4) equals: #[1 0 0 0].
	self assert: ((1 bitShift: 24) asByteArrayOfSize: 6) equals: #[0 0 1 0 0 0].
	
	self should: [((1 bitShift: 32) - 1) asByteArrayOfSize: 3] raise: Error.
	self assert: (((1 bitShift: 32) - 1) asByteArrayOfSize: 4) equals: #[255 255 255 255].
	self assert: (((1 bitShift: 32) - 1) asByteArrayOfSize: 5) equals: #[0 255 255 255 255].