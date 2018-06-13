decoding
readPayloadFrom: aByteArray
	super readPayloadFrom: aByteArray.
	self
		promisedID: (aByteArray copyFrom: self startOfPromisedID to: self startOfPromisedID + 3) asPositiveBigEndianInteger;
		payload: (aByteArray copyFrom: self startOfHeaderFragment to: self endOfPayload)
		