standard values
lastHeadersFrameFor: aHeaderBlock
	| frame |
	frame := (H2HeadersFrame new)
		payload: aHeaderBlock;
		streamIdentifier: 5;
		yourself.
	frame flags endHeaders: true.
	^ frame