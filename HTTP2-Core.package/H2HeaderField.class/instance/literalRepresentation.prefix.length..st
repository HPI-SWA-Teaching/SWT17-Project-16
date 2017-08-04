encoding
literalRepresentation: anIndexTable prefix: aPrefix length: aLength
	^ anIndexTable indexOfKey: self key 
		ifPresent: [:index | 
			self literalRepresentationIndexedKey: index prefix: aPrefix length: aLength]
		ifAbsent: [self literalRepresentationNewKey: aPrefix]