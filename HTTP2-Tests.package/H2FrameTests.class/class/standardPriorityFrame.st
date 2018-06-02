standard values
standardPriorityFrame
	^ H2PriorityFrame new
		streamIdentifier: 13;
		exclusive: true;
		streamDependency: 7;
		weight: 8;
		yourself.