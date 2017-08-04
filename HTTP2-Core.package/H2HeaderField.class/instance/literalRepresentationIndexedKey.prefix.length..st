encoding
literalRepresentationIndexedKey: index prefix: prefix length: length
	| byteArray |
	byteArray := (self encodeInteger: index with: 8 - length).
	byteArray at: 1 put: byteArray first + prefix.
	^ byteArray, (self encodeString: self value)