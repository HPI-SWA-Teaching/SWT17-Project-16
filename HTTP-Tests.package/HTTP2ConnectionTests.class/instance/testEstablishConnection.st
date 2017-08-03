as yet unclassified
testEstablishConnection
	| mockStream frame inframe |
	mockStream := self establishMockConnectionFor: HTTP2Connection new..
	inframe := HTTP2SettingsFrame new
			add: 'MaxConcurrentStreams'->100;
			yourself.
	mockStream inStream addAll: inframe encode.
	(Delay forMilliseconds: 10) wait.
	"wait some time for the http2connection to send an acknowledgement for the received settings"
	frame := HTTP2SettingsFrame new
			flagAck: 1;
			yourself.
	self assert: mockStream outStream contents equals: self connectionPreface, frame encode.