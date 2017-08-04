encoding
encode: anIndexTable
	^ ByteArray streamContents: [:stream |
		self dictionary associationsDo: [:association |
			stream nextPutAll: (association encodeWithPayload: anIndexTable)]]