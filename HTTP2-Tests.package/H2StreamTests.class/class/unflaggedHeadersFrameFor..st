standard values
unflaggedHeadersFrameFor: aHeaderBlock
	^ (H2HeadersFrame new)
		payload: aHeaderBlock;
		streamIdentifier: 5;
		yourself