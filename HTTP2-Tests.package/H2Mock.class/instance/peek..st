as yet unclassified
peek: anInteger
	| oldPosition result |
	oldPosition := self inStream position.
	result := self inStream next: anInteger.
	self inStream position: oldPosition.
	^ result