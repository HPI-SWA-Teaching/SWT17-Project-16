huffman
appendToHuffmanResult: anOrderedCollection at: index value: newValue
	index > anOrderedCollection size ifTrue:  [
		anOrderedCollection addLast: newValue
	]  ifFalse: [
		anOrderedCollection at: index put: (newValue + anOrderedCollection at: index)
	].
