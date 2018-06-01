accessing
streamFor: aFrame
	^ aFrame hasControlStreamIdentifier
		ifTrue: [self controlStream]
		ifFalse: [self getActiveStreamFor: aFrame]