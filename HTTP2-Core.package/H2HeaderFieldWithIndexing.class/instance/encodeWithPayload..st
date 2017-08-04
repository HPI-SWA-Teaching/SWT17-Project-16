encoding
encodeWithPayload: anIndexTable
	| byteArray |
	^ anIndexTable indexOf: self
		ifPresent: [:index | self indexedRepresentation: index] 
		ifAbsent: [byteArray := super encodeWithPayload: anIndexTable.
			anIndexTable add: self.
			byteArray]
	
	