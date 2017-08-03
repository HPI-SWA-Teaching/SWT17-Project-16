encoding
literalRepresentationNewKey: aPrefix
	^ (self integer: aPrefix asByteArrayOfSize: 1), (self encodeString: self key), (self encodeString: self value)