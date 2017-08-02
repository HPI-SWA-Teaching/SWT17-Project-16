as yet unclassified
getPayloadFrom: aByteArray
	self payload: (aByteArray copyFrom: 10 to: aByteArray size).
	self decodeParameterList.