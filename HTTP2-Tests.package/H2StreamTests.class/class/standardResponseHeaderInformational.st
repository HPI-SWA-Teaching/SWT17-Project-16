standard values
standardResponseHeaderInformational
	^ H2Header new
		add: ':status'->'100';
		add: 'server'->'Apache';
		add: 'warning'->'continue with this long informational header';
		yourself 