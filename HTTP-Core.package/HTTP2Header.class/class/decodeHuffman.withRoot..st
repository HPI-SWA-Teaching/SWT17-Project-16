huffman
decodeHuffman: encodedBlock withRoot: root
	| result node  bytePosition bitPosition |

	result := OrderedCollection  new.
	node := root.

	bytePosition := 1.
	bitPosition := 7.
	
	[true] whileTrue: [
		node := node getNodeFor: (encodedBlock at: bytePosition) with: 1 << bitPosition.
		node ifNil: [
			^ ByteArray withAll: result
		].
		(self appendLeaf: node toHuffmanResult: result) ifTrue: [
			node := root
		].
		(bitPosition = 0) ifTrue: [
			bitPosition := 7.
			bytePosition := bytePosition + 1.
			(bytePosition > encodedBlock size) ifTrue: [ 
				^ ByteArray withAll: result
			].
		] ifFalse: [
			bitPosition := bitPosition - 1.
		].
	]