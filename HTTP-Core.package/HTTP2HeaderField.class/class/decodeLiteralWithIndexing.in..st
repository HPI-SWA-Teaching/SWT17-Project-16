decode
decodeLiteralWithIndexing: aStream in: aContext
	| firstByte key headerField |
	firstByte := aStream peek bitAnd: 16r3f.
	firstByte = 0
		ifTrue: [aStream next. key := self decodeString: aStream]
		ifFalse: [key := (aContext at: (self decodeInteger: aStream prefix: 6)) key].
	headerField := self key: key value: (self decodeString: aStream).
	aContext add: headerField key with: headerField value.
	^ headerField