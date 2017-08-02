receiving
receive
|length aFrame|
	[length := (self socketStream peek: 3) asByteArray asInteger.
	aFrame := HTTP2Frame getFrameFrom: (self socketStream next: length + 9) asByteArray.
	(aFrame streamIdentifier = 0)
		ifTrue: [aFrame receiveOnStream: self controlStream]
		ifFalse: [aFrame receiveOnStream: (self activeStreams at: aFrame streamIdentifier ifAbsent: [self receiveOnNonActiveStream: aFrame])]]
	on: SocketPrimitiveFailed do: [self socketClosed] 