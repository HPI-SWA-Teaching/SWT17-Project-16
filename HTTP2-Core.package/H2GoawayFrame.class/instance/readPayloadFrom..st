decoding
readPayloadFrom: aByteArray
	self lastID: (aByteArray copyFrom: self startOfLastStreamID to: self startOfLastStreamID + 3) asInteger.
	self errorCode: (aByteArray copyFrom: self startOfErrorCode to: self startOfErrorCode + 3) asInteger.
	self debugData: ((aByteArray copyFrom: self startOfDebugData to: self endOfPayload) asArray).
