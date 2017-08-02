decode
decodeLiteralWithoutIndexing: aStream in: aContext
	| firstByte key |
	firstByte := aStream peek bitAnd: 16r0f.
	firstByte = 0
		ifTrue: [aStream next. key := self decodeString: aStream]
		ifFalse: [key := (aContext at: (self decodeInteger: aStream prefix: 4)) key].
	^ self key: key value: (self decodeString: aStream).