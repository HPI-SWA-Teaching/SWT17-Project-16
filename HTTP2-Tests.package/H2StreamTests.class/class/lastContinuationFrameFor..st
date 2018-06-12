standard values
lastContinuationFrameFor: aHeaderBlock
	| frame |
	frame := (H2ContinuationFrame new)
		payload: aHeaderBlock;
		streamIdentifier: 5;
		yourself.
	frame flags endHeaders: true.
	^ frame