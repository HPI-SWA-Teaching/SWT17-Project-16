encoding
literalRepresentationNewKey: aPrefix
	^ (aPrefix asByteArrayOfSize: 1), 
	(self encodeString: self key), 
	(self encodeString: self value)