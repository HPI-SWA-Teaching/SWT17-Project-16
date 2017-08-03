as yet unclassified
decodeHuffman: encodedBlock to: decodeStream index: index treePosition: position
	| bit pos |
	bit := self nextHuffmanBitFor: encodedBlock at: index.
	pos := (self huffmanTree at: position + bit) - 256.
	pos < 0 ifTrue: [
		decodeStream nextPut: (self huffmanTree at: position + bit).
		pos := 1].
	index + 1 < (encodedBlock size * 8) ifTrue: [
		self decodeHuffman: encodedBlock to: decodeStream index: index + 1 treePosition: pos]