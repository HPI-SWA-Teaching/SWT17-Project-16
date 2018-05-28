accessing
flagSet: aBitPosition to: aBoolean
	self flags: (self flags bitAt: aBitPosition put: aBoolean integerRepesentation)