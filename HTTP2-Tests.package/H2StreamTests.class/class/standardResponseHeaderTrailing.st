standard values
standardResponseHeaderTrailing
	^ H2Header new
		add: 'foo'->'this is an entry in a trailing header';
		yourself 