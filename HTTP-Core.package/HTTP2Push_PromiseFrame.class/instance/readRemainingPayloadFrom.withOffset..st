decoding
readRemainingPayloadFrom: aByteArray withOffset: anOffset
	self promisedID: (self getIntegerFrom: aByteArray from: self class startOfPayload + anOffset to: 13 + anOffset).
	self payload: (aByteArray copyFrom: 14 + anOffset to: self endPoint)