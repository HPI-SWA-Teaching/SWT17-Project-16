accessing
getPayloadFrom: aByteArray
	super getPayloadFrom: aByteArray.
	self getRestPayloadFrom: aByteArray withOffset: self flagPadded.
		