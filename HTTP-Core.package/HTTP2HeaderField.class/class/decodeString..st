decode
decodeString: aStream
	| length huffBit |
	huffBit := aStream peek bitAt: 8.
	length := self decodeInteger: aStream prefix: 7.
	^ huffBit = 0
		ifTrue: [(aStream next: length) asString]
		ifFalse: [(HTTP2Header decodeHuffman: (aStream next: length) asByteArray) asByteArray asString]