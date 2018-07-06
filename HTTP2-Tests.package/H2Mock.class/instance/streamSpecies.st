initialize-release
streamSpecies
	"implemented for Squeak5, not necessary in Sq6"
	^ binarySQ5 ifTrue: [ByteArray] ifFalse: [ByteString].
