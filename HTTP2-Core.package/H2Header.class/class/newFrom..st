instance creation
newFrom: aWebRequest 
	^ H2Header new
		add: ':method' -> aWebRequest method;
		add: ':path' -> aWebRequest rawUrl;
		add: ':scheme' -> 'http';
		add: ':authority' -> (aWebRequest headerAt: 'Host');
		addAll: (self extractHeaderFrom: aWebRequest);
		yourself.