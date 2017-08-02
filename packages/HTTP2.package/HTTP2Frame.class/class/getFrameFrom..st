instance creation
getFrameFrom: aByteArray
	| frame |
	frame := (self typeDictionary at: (aByteArray at: 4)) new.
	frame flags: (aByteArray at: 5).
	frame length: ((aByteArray copyFrom: 1  to: 3) asInteger).
	frame streamIdentifier: ((aByteArray copyFrom: 6 to: 9) asInteger).
	frame getPayloadFrom: aByteArray.
	^ frame
	