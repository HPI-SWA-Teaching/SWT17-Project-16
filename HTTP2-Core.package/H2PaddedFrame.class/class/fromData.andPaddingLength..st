instance creation
fromData: data andPaddingLength: aPaddingLength
	| frame |
	frame := super fromPayload: data.
	frame padding: (ByteArray new: aPaddingLength).
	frame flags padded: true.
	^ frame