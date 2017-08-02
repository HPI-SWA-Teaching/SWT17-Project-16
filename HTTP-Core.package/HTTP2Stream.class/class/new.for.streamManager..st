as yet unclassified
new: id for: aRequest streamManager: aStreamManager
	^ (HTTP2Stream new)
		id: id;
		request: aRequest;
		streamManager: aStreamManager;
		flowControlWindow: aStreamManager initialWindowSize;
		yourself.