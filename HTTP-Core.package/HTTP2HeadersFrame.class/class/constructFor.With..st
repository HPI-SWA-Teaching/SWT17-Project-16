instance creation
constructFor: aStream With: maxPayloadSize
	| frame | 
	aStream initializeHeaderStreamOut.
	frame := super constructFor: aStream With: maxPayloadSize andOutstream: aStream headerStreamOut.
	aStream setEndFlagsFor: frame.
	frame setEndFlagsFor: aStream.
	^ frame