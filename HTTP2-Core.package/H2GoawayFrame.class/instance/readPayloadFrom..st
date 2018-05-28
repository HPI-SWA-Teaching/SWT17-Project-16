decoding
readPayloadFrom: aByteArray
	self lastID: (aByteArray copyFrom: self startOfLastStreamID to: self startOfLastStreamID + 3) asPositiveBigEndianInteger.
	self errorCode: (aByteArray copyFrom: self startOfErrorCode to: self startOfErrorCode + 3) asPositiveBigEndianInteger.
	self debugData: ((aByteArray copyFrom: self startOfDebugData to: self endOfPayload) asArray).
