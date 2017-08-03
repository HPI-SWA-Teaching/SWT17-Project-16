instance creation
nextHuffmanBitFor: encodedBlock at: index
	| bytePos bitPos |
	bytePos := index // 8 + 1.
	bitPos := 8 - (index \\ 8).
	^ (encodedBlock at: bytePos) bitAt: bitPos