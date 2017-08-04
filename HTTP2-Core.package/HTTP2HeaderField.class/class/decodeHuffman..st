huffman decoding
decodeHuffman: encodedBlock
	| decodeStream |
	decodeStream := WriteStream on: ByteArray new.
	self decodeHuffman: encodedBlock to: decodeStream index: 0 treePosition: 1.
	^ decodeStream contents