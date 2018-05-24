decoding
readPayloadFrom: aByteArray
	self lastID: (self getIntegerFrom: aByteArray from: self startOfLastStreamID to: self startOfLastStreamID + 3).
	self errorCode: (self getIntegerFrom: aByteArray from: self startOfErrorCode to: self startOfErrorCode + 3).
	self debugData: ((aByteArray copyFrom: self startOfDebugData to: self endOfPayload) asArray).
