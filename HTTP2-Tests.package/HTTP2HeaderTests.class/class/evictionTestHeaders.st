test-headers
evictionTestHeaders
	^ OrderedCollection new
		add: (H2Header new
			add: ':status'->'302';
			add: 'cache-control'->'private';
			add: 'date'->'Mon, 21 Oct 2013 20:13:21 GMT';
			add: 'location'->'https://www.example.com';
			yourself);
		add: (H2Header new
			add: ':status'->'307';
			add: 'cache-control'->'private';
			add: 'date'->'Mon, 21 Oct 2013 20:13:21 GMT';
			add: 'location'->'https://www.example.com';
			yourself);
		add: (H2Header new
			add: ':status'->'200';
			add: 'cache-control'->'private';
			add: 'cache-control'->'private';
			add: 'date'->'Mon, 21 Oct 2013 20:13:22 GMT';
			add: 'location'->'https://www.example.com';
			add: 'content-encoding'->'gzip';
			add: 'set-cookie'->
			'foo=ASDJKHQKBZXOQWEOPIUAXQWEOIU; max-age=3600; version=1';
			yourself);
		yourself