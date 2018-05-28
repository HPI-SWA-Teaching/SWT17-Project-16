instance creation
getFrameFrom: aByteArray
	^ (self typeDictionary at: (aByteArray at: self typePosition)) new
	 	flags: (aByteArray at: self flagPosition);
		length: (aByteArray copyFrom: 1 to: 3) asInteger;
		streamIdentifier: (aByteArray copyFrom: 6 to: 9) asInteger;
		readPayloadFrom: aByteArray; 
		yourself