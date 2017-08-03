instance creation
connectTo: aServer
	^ (HTTP2Connection new)
		connectTo: aServer;
		yourself