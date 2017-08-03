constants
standardGoawayFrame
	^ HTTP2GoawayFrame new 
		streamIdentifier: 0;
		lastID: 2; 
		errorCode: 0; 
		debugData: ''; 
		yourself