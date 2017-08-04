instance creation
connectTo: aServer
	^ (H2Connection new)
		connectTo: aServer;
		yourself