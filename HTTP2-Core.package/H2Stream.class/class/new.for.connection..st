instance creation
new: id for: aRequest connection: aConnection
	^ (H2Stream new)
		id: id;
		request: aRequest;
		connection: aConnection;
		flowControlWindow: aConnection initialWindowSize;
		yourself