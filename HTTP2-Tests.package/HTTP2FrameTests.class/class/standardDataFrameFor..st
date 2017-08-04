standard values
standardDataFrameFor: aHeaderBlock
	^ (H2DataFrame new)
				payload: aHeaderBlock;
				streamIdentifier: 5;
				flagEndStream: 1;
				yourself