initializing
initializeFrom: aByte
	aByte < 256
		ifFalse: [^ H2Error signal: 'invalid flag size'].
	
	flagStorage := aByte