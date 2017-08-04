connecting
establishTransportLayerConnectionTo: aServer
	self socketStream: 
		(SocketStream openConnectionToHostNamed: aServer port: self class standardPort).