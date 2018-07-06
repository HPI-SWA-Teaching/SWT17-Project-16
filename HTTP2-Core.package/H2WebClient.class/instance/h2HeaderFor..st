private
h2HeaderFor: aWebRequest
	^ H2Header new
		add: ':method'   -> aWebRequest method;
		add: ':path'        -> aWebRequest rawUrl;
		add: ':scheme'   -> 'http';
		add: ':authority' -> self server;
		addAll: (self headerAssociationsFrom: aWebRequest);
		yourself.