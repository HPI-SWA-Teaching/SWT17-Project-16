instance creation
new: id on: aConnection
	^ H2Stream new
		id: id;
		connection: aConnection;
		flowControlWindow: aConnection initialWindowSize;
		yourself