decoding
readPayloadFrom: aByteArray
	super readPayloadFrom: aByteArray.
	self hasPriorityFlag ifTrue: [self readPriorityValuesFrom: aByteArray].
	self payload: (aByteArray copyFrom: self startOfHeaderFragment to: self endOfPayload)