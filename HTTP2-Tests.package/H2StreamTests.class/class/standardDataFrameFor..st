frame generation
standardDataFrameFor: aHeaderBlock
	| frame |
	frame := H2DataFrame new
		payload: aHeaderBlock;
		streamIdentifier: 5;
		yourself.
	frame flags endStream: true.
	^ frame