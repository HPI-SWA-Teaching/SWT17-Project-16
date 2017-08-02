as yet unclassified
defaultSettings
	^ (Dictionary new)
		add: 'HeaderTableSize'->4096;
		add: 'EnablePush'->1;
		"add: 'MaxConcurrentStreams'->infinity; As the default is Infinity, we don't have to define a default value"
		add: 'InitialWindowSize'->((2 raisedTo: 16) - 1);
		add: 'MaxFrameSize'->(2 raisedTo: 14);
		"add: 'MaxHeaderListSize'->infinity; As the default is infinity, we don't have to define a deafault value"
		yourself