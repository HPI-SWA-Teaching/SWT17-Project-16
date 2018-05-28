standard values
standardContinuationFrameFor: aHeaderBlock
	^ (H2ContinuationFrame new)
		payload: aHeaderBlock;
		streamIdentifier: 5;
		setEndHeadersFlag: true;
		yourself.