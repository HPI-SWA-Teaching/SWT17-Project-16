decoding
readPayloadFrom: aByteArray
	super readPayloadFrom: aByteArray.
	self flags priority ifTrue: [self readPriorityValuesFrom: aByteArray].
	self payload: (aByteArray copyFrom: self startOfHeaderFragment to: self endOfPayload)