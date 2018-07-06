instance creation
newForRequest: aRequest onServer: server withPromise: aPromise

	^self new
		server: server;
		request: aRequest;
		promise: aPromise;
		expires: (TimeStamp now + self expireDuration);
		yourself