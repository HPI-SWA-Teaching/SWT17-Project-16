instance creation
getFrameFrom: aByteArray
	| frame |
	frame := (self typeDictionary at: (aByteArray at: 4)) new.
	frame flags: (aByteArray at: 5).
	frame length: (self byteArrayToInteger: (aByteArray copyFrom: 1  to: 3)).
	frame streamIdentifier: (self byteArrayToInteger: (aByteArray copyFrom: 6 to: 9)).
	frame getPayloadFrom: aByteArray.
	^ frame
	