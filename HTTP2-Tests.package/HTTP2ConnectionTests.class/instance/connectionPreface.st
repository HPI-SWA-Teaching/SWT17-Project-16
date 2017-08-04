initialization
connectionPreface
	| frame |
	frame := H2SettingsFrame new
			add: 'EnablePush'->0;
			add: 'InitialWindowSize'->((2 raisedTo: 31) - 1);
			yourself.
	^ H2Connection connectionPreface, frame encode