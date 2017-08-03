instance creation
constructFor: aStream With: maxPayloadSize andOutstream: anOutstream
	^ (self new)
		streamIdentifier: aStream id;
		payload: (anOutstream next: maxPayloadSize )