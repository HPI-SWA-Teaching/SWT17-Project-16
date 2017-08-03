huffman
appendLeaf: aPrefixTree toHuffmanResult: anOrderedCollection
	aPrefixTree isLeaf ifTrue: [
		anOrderedCollection addLast: aPrefixTree value  - 1.
		^ true
	].
	^ false