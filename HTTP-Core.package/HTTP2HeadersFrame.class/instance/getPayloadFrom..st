decoding
getPayloadFrom: aByteArray
	super getPayloadFrom: aByteArray.
	self flagPriority 
	ifTrue: [self getRestPayloadFrom: aByteArray WithOffset: self flagPadded .]
	ifFalse: [self payload: (aByteArray copyFrom: self startOfPayload + self flagPadded to: self endPoint).]