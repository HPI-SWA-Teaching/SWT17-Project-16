as yet unclassified
connectTo: aServer
	^ (HTTP2Connection new)
		connectTo: aServer;
		yourself.