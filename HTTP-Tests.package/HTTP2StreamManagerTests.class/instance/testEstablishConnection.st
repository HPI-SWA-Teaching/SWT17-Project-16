as yet unclassified
testEstablishConnection
	| streamManager mockStream outframe outcontents inframe |
	mockStream := HTTP2MockSocketStream new.
	streamManager := HTTP2Connection new.
	"dont't use connectTo: method because we need to apply MockSocketStream instead of establishing real Connection"
	streamManager socketStream: mockStream.
	streamManager initiateCommunication.
	
	outframe := HTTP2SettingsFrame new
			add: 'EnablePush'->0;
			add: 'InitialWindowSize'->((2 raisedTo: 31) - 1);
			yourself.
	outcontents := HTTP2Connection connectionPreface asByteArray, outframe encode.
	self assert: mockStream outStream contents equals: outcontents.
	"wait some time for the http2connection to send an acknowledgement for the received settings"
	inframe := HTTP2SettingsFrame new
			add: 'MaxConcurrentStreams'->100;
			yourself.
	mockStream inStream addAll: inframe encode.
	(Delay forMilliseconds: 100) wait.
	outframe := HTTP2SettingsFrame new
			flagAck: 1;
			yourself.
	outcontents := outcontents, outframe encode.
	self assert: mockStream outStream contents equals: outcontents.