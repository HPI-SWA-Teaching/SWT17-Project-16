standard values
standardPushPromiseHeader
	^ H2Header new
		add: ':method'->'GET';
		add: ':scheme'->'http';
		add: ':path' ->'/pushedresource';
		add: ':authority'->'www.example.com';
		yourself