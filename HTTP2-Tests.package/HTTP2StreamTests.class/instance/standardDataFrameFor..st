standard values
standardDataFrameFor: aHeaderBlock
	^ (HTTP2DataFrame new)
				payload: aHeaderBlock;
				streamIdentifier: 5;
				flagEndStream: 1;
				yourself