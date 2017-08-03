as yet unclassified
connectionPreface
	| frame |
	frame := HTTP2SettingsFrame new
			add: 'EnablePush'->0;
			add: 'InitialWindowSize'->((2 raisedTo: 31) - 1);
			yourself.
	^ HTTP2Connection connectionPreface, frame encode