instance creation
new: id for: aRequest connection: aConnection
	^ (HTTP2Stream new)
		id: id;
		request: aRequest;
		connection: aConnection;
		flowControlWindow: aConnection initialWindowSize;
		yourself