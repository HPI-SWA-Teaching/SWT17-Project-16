frame generation
veryLastDataFrameFor: aHeaderBlock
	| frame |
	frame := self unflaggedDataFrameFor: aHeaderBlock.
	frame flags endStream: true.
	^ frame