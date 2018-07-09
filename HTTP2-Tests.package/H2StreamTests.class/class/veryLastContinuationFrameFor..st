frame generation
veryLastContinuationFrameFor: aHeaderBlock
	| frame |
	frame := self lastContinuationFrameFor: aHeaderBlock.
	frame flags endStream: true.
	^ frame