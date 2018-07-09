standard values
standardResponseHeader 
	^ H2Header new
		add: ':status'->'200';
		add: 'server'->'Apache';
		add: 'warning'->'filler for longer header needed';
		yourself 