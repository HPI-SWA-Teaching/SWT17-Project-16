instance creation
newWithStream: aStream at: aServer	
	^H2Session new 
		server: aServer;
		connection: (H2Connection new
						socketStream: aStream;
						initiateCommunication;
						yourself);
		yourself.