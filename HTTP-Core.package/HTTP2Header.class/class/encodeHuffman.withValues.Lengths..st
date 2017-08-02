instance creation
encodeHuffman: decodedBlock withValues: code Lengths: length
	| result resultIndex filledBits actualLength actualPlain shiftCount byteCount |

	result := OrderedCollection new.
	resultIndex := 1.
	filledBits := 0.

	decodedBlock do: [:byte|
		actualLength := length at: (byte + 1).
		shiftCount := ((40 - actualLength - filledBits) \\ 8).
		byteCount := actualLength - 1 // 8 + 1.
		(actualLength \\ 8 + shiftCount) > 8 ifTrue: [
			byteCount := byteCount + 1.
		].
		
		actualPlain := (code at: (byte + 1)) << shiftCount.
		1 to: byteCount do: [ :n|
			self appendToHuffmanResult: result 
				at: resultIndex 
				value: (self getNthByteOf: actualPlain at: byteCount - n) .
			resultIndex := resultIndex + 1.
		].
	
		filledBits := filledBits + actualLength \\ 8.
		filledBits = 0 ifFalse: [
			resultIndex := resultIndex -1
		]
	].
	^ ByteArray withAll: result
