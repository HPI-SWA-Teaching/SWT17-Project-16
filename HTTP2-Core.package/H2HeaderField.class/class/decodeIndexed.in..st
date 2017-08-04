decoding
decodeIndexed: aStream in: aContext
	| index |
	index := self decodeInteger: aStream prefix: 7.
	^ self key: (aContext at: index) key value: (aContext at: index) value