standard values
standardPriorityFrame
	^ HTTP2PriorityFrame new
		streamIdentifier: 13;
		exclusiveBit: 1;
		streamDependency: 7;
		weight: 8;
		yourself.