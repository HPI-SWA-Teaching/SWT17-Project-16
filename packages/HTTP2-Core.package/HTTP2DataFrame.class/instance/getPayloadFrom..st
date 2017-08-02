accessing
getPayloadFrom: aByteArray
	super getPayloadFrom: aByteArray.
	self payload: (aByteArray copyFrom:  10 + self flagPadded to: self endPoint ).
	
	