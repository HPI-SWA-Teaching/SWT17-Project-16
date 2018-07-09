standard values
standardPushPromiseFrameFor: aHeaderBlock
	^ (H2PushPromiseFrame new)
				payload: aHeaderBlock;
				streamIdentifier: 5;
				promisedID: 6;
				yourself