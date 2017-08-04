connecting
connectTo: aServer
	[self establishTransportLayerConnectionTo: aServer.
	self initiateCommunication] on: ConnectionRefused do: [:exception | exception signal]