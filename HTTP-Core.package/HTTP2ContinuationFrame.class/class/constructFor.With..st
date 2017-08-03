instance creation
constructFor: aStream With: maxPayloadSize
	| frame | 
	frame := super constructFor: aStream With: maxPayloadSize andOutstream: aStream headerStreamOut.
	aStream headerStreamOut atEnd ifTrue: [frame flagEndHeaders: 1].
	^ frame