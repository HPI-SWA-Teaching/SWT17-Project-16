decoding
readPayloadFrom: aByteArray
	super readPayloadFrom: aByteArray.
	self payload: (aByteArray copyFrom: self startOfPaddedPayload to: self endOfPayload)