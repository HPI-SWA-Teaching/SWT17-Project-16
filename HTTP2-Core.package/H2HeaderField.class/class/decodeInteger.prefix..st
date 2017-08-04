decoding
decodeInteger: aStream prefix: aPrefix
	| value |
	value := aStream next bitAnd: (self bitMaskFor: aPrefix).
	^ value < (self bitMaskFor: aPrefix)
		ifTrue: [value]
		ifFalse: [value + (self decodeLongIntegerFrom: aStream)]