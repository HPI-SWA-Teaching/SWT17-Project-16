frame generation
unflaggedPushPromiseFrameFor: aHeaderBlock
	^ (H2PushPromiseFrame new)
		promisedID: 6;
		payload: aHeaderBlock;
		streamIdentifier: 5;
		yourself