instance creation
encodeHuffman: decodedBlock
	^ self encodeHuffman: decodedBlock withValues: (self getHuffmanRFCValueCollection) Lengths: self getHuffmanRFCLengthCollection.