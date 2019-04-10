frame generation
lastHeaderFrameFor: aHeaderBlock
	| frame |
	frame := self unflaggedHeaderFrameFor: aHeaderBlock.
	frame flags endHeaders: true.
	^ frame