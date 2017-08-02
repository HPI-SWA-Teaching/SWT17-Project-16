encoding
encodeWithPayload: anIndexTable
	^ self
		literalRepresentation: anIndexTable
		prefix: self leadingBits
		length: self leadingBitsLength.