as yet unclassified
constructFor: aStream With: maxPayloadSize
	| frame | 
	frame := super constructFor: aStream With: maxPayloadSize andOutstream: aStream dataStreamOut.
	aStream dataStreamOut atEnd ifTrue: [frame flagEndStream: 1. aStream state allDataSent].
	^ frame