frame generation
unflaggedDataFrameFor: aHeaderBlock
	^ H2DataFrame new
		payload: aHeaderBlock;
		streamIdentifier: 5;
		yourself