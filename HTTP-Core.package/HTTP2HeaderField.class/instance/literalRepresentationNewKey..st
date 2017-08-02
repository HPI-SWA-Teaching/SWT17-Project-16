encoding
literalRepresentationNewKey: aPrefix
	^ aPrefix asByteArray, (self encodeString: self key), (self encodeString: self value).