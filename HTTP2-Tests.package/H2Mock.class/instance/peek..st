SqueakV5additions
peek: anInteger
	"implemented for Squeak5, not necessary in Sq6"
	| oldPosition result |
	oldPosition := self inStream position.
	result := self inStream next: anInteger.
	self inStream position: oldPosition.
	^ result