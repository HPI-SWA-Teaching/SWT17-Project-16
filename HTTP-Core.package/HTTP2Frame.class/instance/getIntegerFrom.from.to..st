accessing
getIntegerFrom: aByteArray from: start to: end
	^ self class byteArrayToInteger: (aByteArray copyFrom: start to: end) 