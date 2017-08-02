instance creation
newFrom: aStream in: aContext
	| firstByte |
	firstByte := aStream peek.
	(firstByte bitAt: 8) = 1
		ifTrue: [^ self decodeIndexed: aStream in: aContext]
		ifFalse: [(firstByte bitAt: 7) = 1
			ifTrue: [^ self decodeLiteralWithIndexing: aStream in: aContext]
			ifFalse: [^ self decodeLiteralWithoutIndexing: aStream in: aContext]]
				"Todo: receive update of max Table size here?"