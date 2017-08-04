decode
decodeLiteralWithoutIndexing: aStream in: aContext
	^ self key: 
		((aStream peek bitAnd: self prefixBitMaskWithoutIndexing) = 0
		ifTrue: [aStream next. self decodeString: aStream]
		ifFalse: [(aContext at: (self decodeInteger: aStream prefix: 4)) key])
		value: (self decodeString: aStream)