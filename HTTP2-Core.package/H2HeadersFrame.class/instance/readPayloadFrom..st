decoding
readPayloadFrom: aByteArray
	super readPayloadFrom: aByteArray.
	self flagPrioritySet ifTrue: [self readPriorityValuesFrom: aByteArray].
	self payload: (aByteArray copyFrom: self startOfHeaderFragment to: self endOfPayload)