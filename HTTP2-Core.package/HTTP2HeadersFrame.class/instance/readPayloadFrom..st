decoding
readPayloadFrom: aByteArray
	super readPayloadFrom: aByteArray.
	self flagPriority ifTrue: [
			self readRemainingPayloadFrom: aByteArray withOffset: self flagPadded]
		ifFalse: [
			self payload: (aByteArray copyFrom: self class startOfPayload + self flagPadded to: self endPoint)]