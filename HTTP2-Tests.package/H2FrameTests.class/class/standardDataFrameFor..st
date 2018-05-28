standard values
standardDataFrameFor: aHeaderBlock
	^ (H2DataFrame new)
				payload: aHeaderBlock;
				streamIdentifier: 5;
				setEndStreamFlag: true;
				yourself