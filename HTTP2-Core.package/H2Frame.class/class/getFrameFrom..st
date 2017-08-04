instance creation
getFrameFrom: aByteArray
	^ (self typeDictionary at: (aByteArray at: self typePosition)) new
	 	flags: (aByteArray at: self flagPosition);
		length: (self byteArrayToInteger: (aByteArray copyFrom: 1 to: 3));
		streamIdentifier: (self byteArrayToInteger: (aByteArray copyFrom: 6 to: 9));
		readPayloadFrom: aByteArray; 
		yourself