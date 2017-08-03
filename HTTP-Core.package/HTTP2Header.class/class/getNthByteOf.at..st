huffman
getNthByteOf: anInteger at: pos
	^ (anInteger bitAnd: 255 << (8 * pos)) >> (pos * 8)