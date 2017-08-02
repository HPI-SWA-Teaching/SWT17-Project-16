as yet unclassified
fromData: data andPaddingLength: aPaddingLength
	| frame |
	frame := super fromPayload: data.
	frame padding: (ByteArray new: aPaddingLength).
	frame flagPadded: 1.
	^ frame