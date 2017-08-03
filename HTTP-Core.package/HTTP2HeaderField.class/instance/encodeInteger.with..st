encoding
encodeInteger: anInteger with: aPrefix
	| cachedPrefix |
	cachedPrefix:= (2 raisedToInteger: aPrefix) - 1.
	anInteger < cachedPrefix
		ifTrue: [^self integer: anInteger asByteArrayOfSize: 1] 
		ifFalse: [ ^self encodeRemaindingInteger: anInteger with: cachedPrefix]