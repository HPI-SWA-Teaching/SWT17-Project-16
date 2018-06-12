standard values
unflaggedContinuationFrameFor: aHeaderBlock
	^ (H2ContinuationFrame new)
		payload: aHeaderBlock;
		streamIdentifier: 5;
		yourself