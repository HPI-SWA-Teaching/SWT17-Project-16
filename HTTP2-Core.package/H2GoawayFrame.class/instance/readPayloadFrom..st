decoding
readPayloadFrom: aByteArray
	self lastID: (Integer from: (aByteArray copyFrom: self startOfLastStreamID to: self startOfLastStreamID + 3)).
	self errorCode: (Integer from: (aByteArray copyFrom: self startOfErrorCode to: self startOfErrorCode + 3)).
	self debugData: ((aByteArray copyFrom: self startOfDebugData to: self endOfPayload) asArray).
