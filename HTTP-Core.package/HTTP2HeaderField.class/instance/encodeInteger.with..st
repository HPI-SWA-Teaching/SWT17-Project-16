encoding
encodeInteger: anInteger with: aPrefix
	| cachedPrefix |
	cachedPrefix:= (2 raisedToInteger: aPrefix) - 1.
	^ anInteger < cachedPrefix
		ifTrue: [ByteArray with: anInteger] 
		ifFalse: [self encodeRemainingInteger: anInteger with: cachedPrefix]