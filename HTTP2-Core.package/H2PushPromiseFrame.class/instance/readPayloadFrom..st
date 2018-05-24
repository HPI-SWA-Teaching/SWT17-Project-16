decoding
readPayloadFrom: aByteArray
	super readPayloadFrom: aByteArray.
	self promisedID: (self getIntegerFrom: aByteArray from: self startOfPromisedID to: self startOfPromisedID + 3).
	self payload: (aByteArray copyFrom: self startOfHeaderFragment to: self endOfPayload)
		