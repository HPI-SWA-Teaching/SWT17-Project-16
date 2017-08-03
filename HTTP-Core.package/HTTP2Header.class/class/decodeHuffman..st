huffman
decodeHuffman: encodedBlock
	^ self decodeHuffman: encodedBlock withRoot: self getHuffmanTree