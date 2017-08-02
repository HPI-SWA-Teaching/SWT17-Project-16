encoding
indexedRepresentation: anIndex
	| byteArray |
	byteArray := (self encodeInteger: anIndex with: 7).
	byteArray at: 1 put: byteArray first + 128.
	^ byteArray.