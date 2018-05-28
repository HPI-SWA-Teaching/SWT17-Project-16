decoding
readPayloadFrom: aByteArray
	super readPayloadFrom: aByteArray.
	self promisedID: (Integer from: (aByteArray copyFrom: self startOfPromisedID to: self startOfPromisedID + 3)).
	self payload: (aByteArray copyFrom: self startOfHeaderFragment to: self endOfPayload)
		