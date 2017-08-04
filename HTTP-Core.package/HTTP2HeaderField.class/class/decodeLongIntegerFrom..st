decode
decodeLongIntegerFrom: aStream
	| byte |
	byte := aStream next.
	^ (byte bitAt: 8) = 0
		ifTrue: [byte]
		ifFalse: [(self decodeLongIntegerFrom: aStream) << 7 + (byte bitAnd: 127)]