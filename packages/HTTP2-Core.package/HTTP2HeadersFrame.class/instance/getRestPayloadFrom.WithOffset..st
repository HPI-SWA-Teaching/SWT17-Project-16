as yet unclassified
getRestPayloadFrom: aByteArray WithOffset: offset
	self getStreamDependencyFrom: aByteArray WithOffset: offset.
	self weight: (self getIntegerFrom: aByteArray from: 14+offset to: 14+offset).
	self payload:  (aByteArray copyFrom: 15 + offset to: self endPoint)