encoding
encodeString: aString
	| stringData |
	stringData := aString asByteArray.
	^ (self encodeInteger: stringData size with: 7), stringData