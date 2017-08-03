instance creation
new: id for: aRequest streamManager: aStreamManager
	^ (HTTP2Stream new)
		id: id;
		request: aRequest;
		connection: aStreamManager;
		flowControlWindow: aStreamManager initialWindowSize;
		yourself