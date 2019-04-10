standard values
standardResponseHeaderError
	^ H2Header new
		add: ':status'->'403';
		add: 'server'->'Apache';
		add: 'warning'->'This resource is forbidden and this header needs a certain length';
		yourself 