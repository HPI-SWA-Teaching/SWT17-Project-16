decode
decodeInteger: aStream prefix: aPrefix
	| value |
	value := aStream next bitAnd: (2 raisedTo: aPrefix) - 1.
	^ value < ((2 raisedTo: aPrefix) - 1)
		ifTrue: [value]
		ifFalse: [value + (self decodeLongIntegerFrom: aStream)]