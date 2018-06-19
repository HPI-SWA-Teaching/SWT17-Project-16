testing
testByteArrayAsPositiveBigEndianInteger
	self assert: #[0] asPositiveBigEndianInteger equals: 0.
	self assert: #[255] asPositiveBigEndianInteger equals: 255.
	self assert: #[1 0] asPositiveBigEndianInteger equals: 256.
	self assert: #[1 0 0 0] asPositiveBigEndianInteger equals: (1 bitShift: 24).
	self assert: #[255 255 255 255] asPositiveBigEndianInteger equals: ((1 bitShift: 32) - 1).
	self assert: #[1 0 0 0 0 0 0 0 0] asPositiveBigEndianInteger equals: (1 bitShift: 64).