decoding
readPayloadFrom: aByteArray
	self
		streamDependency: (aByteArray copyFrom: self class startOfPayload to: self class startOfPayload + 3) asPositiveBigEndianInteger;
		exclusive: (self streamDependency bitAt: self class exclusiveBitPosition) = 1;
		streamDependency: (self streamDependency bitAt: self class exclusiveBitPosition put: 0);
		weight: (aByteArray at: self endOfPayload)
	