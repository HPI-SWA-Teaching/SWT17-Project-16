frame generation
lastContinuationFrameFor: aHeaderBlock
	| frame |
	frame := self unflaggedContinuationFrameFor: aHeaderBlock.
	frame flags endHeaders: true.
	^ frame