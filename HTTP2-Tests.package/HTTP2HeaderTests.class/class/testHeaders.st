test-headers
testHeaders
	^ OrderedCollection new
		add: (H2Header new
			add: ':method'->'GET';
			add: ':scheme'->'http';
	 		add: ':path'->'/';
			add: ':authority'->'www.example.com';
			add: 'cache-control'->'no-cache';
			yourself);
		add: (H2Header new
			add: ':method'->'GET';
			add: ':scheme'->'https';
			add: ':path'->'/index.html';
			add: ':authority'->'www.example.com';
			addWithoutIndexing: 'custom-key' value: 'custom-value';
			yourself);
		yourself