connecting
establishTransportLayerConnectionTo: aServer
	self socketStream: (SocketStream openConnectionToHostNamed: aServer port: 80).