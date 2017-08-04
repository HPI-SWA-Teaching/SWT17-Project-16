connecting
sendConnectionPreface
	| frame |
	self socketStream nextPutAll: self class connectionPreface.
	"disable server push"
	frame := (HTTP2SettingsFrame new)
			add: 'EnablePush'->0;
			add: 'InitialWindowSize'->((2 raisedTo: 31) - 1);
			yourself.
	self socketStream nextPutAll: frame encode; flush.