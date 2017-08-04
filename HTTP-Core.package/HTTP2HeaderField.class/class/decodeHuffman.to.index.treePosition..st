huffman decoding
decodeHuffman: encodedBlock to: decodeStream index: index treePosition: position
	| pos |
	pos := self huffmanTree at: position + (self nextHuffmanBitFor: encodedBlock at: index).
	pos <= 0 ifTrue: [
		decodeStream nextPut: pos negated.
		pos := 1].
	index + 1 < (encodedBlock size * 8) ifTrue: [
		self decodeHuffman: encodedBlock to: decodeStream index: index + 1 treePosition: pos]