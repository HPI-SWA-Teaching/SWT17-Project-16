decoding
readPayloadFrom: aByteArray
	super readPayloadFrom: aByteArray.
	self readRemainingPayloadFrom: aByteArray withOffset: self flagPadded
		