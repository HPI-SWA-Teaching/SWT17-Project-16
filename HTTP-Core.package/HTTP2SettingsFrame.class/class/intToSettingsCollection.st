accessing
intToSettingsCollection
	^ OrderedCollection new
		add: 'HeaderTableSize';
		add: 'EnablePush';
		add: 'MaxConcurrentStreams';
		add: 'InitialWindowSize';
		add: 'MaxFrameSize';
		add: 'MaxHeaderListSize';
		yourself