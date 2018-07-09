frame generation
veryLastHeaderFrameFor: aHeaderBlock
	| frame |
	frame := self lastHeaderFrameFor: aHeaderBlock.
	frame flags endStream: true.
	^ frame