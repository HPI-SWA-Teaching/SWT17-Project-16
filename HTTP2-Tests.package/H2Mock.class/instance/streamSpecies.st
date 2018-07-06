initialize-release
streamSpecies
	"polyfill for squeak 5.0 images"
	^ binary ifTrue: [ByteArray] ifFalse: [ByteString].