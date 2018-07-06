initialize-release
streamSpecies

	^ binary ifTrue: [ByteArray] ifFalse: [ByteString].
