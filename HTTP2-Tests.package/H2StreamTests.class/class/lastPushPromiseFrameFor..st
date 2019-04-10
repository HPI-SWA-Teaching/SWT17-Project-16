frame generation
lastPushPromiseFrameFor: aHeaderBlock
	| frame |
	frame := self unflaggedPushPromiseFrameFor: aHeaderBlock.
	frame flags endHeaders: true.
	^ frame