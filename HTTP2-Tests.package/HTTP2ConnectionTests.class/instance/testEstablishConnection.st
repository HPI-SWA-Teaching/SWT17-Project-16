testing
testEstablishConnection
	| mockStream frame inframe |
	mockStream := self establishMockConnectionFor: H2Connection new.
	inframe := H2SettingsFrame new
			add: 'MaxConcurrentStreams'->100;
			yourself.
	mockStream inStream addAll: inframe encode.
	(Delay forMilliseconds: 10) wait.
	"wait some time for the http2connection to send an acknowledgement for the received settings"
	frame := H2SettingsFrame new
			flagAck: 1;
			yourself.
	self assert: mockStream outStream contents equals: self connectionPreface, frame encode.