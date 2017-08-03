encoding
encodeString: aString
	"If Huffman is wanted you have to set first bit and implement Huffman Encoding"
	| stringData |
	stringData := aString asByteArray.
	^ (self encodeInteger: stringData size with: 7), stringData