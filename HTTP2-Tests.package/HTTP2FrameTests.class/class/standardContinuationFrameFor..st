standard values
standardContinuationFrameFor: aHeaderBlock
	^ (HTTP2ContinuationFrame new)
		payload: aHeaderBlock;
		streamIdentifier: 5;
		flagEndHeaders: 1;
		yourself.