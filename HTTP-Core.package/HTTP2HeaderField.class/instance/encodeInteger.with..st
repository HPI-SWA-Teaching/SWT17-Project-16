encoding
encodeInteger: anInteger with: aPrefix
	| cachedPrefix |
	cachedPrefix := self class bitMaskFor: aPrefix.
	^ anInteger < cachedPrefix
		ifTrue: [ByteArray with: anInteger] 
		ifFalse: [self encodeRemainingInteger: anInteger with: cachedPrefix]