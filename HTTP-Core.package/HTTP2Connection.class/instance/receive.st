receiving
receive
	| aFrame|
	[aFrame := HTTP2Frame getFrameFrom: 
		(self socketStream next: self nextLength + HTTP2Frame headerLength) asByteArray.
	(aFrame streamIdentifier = 0)
		ifTrue: [aFrame receiveOnStream: self controlStream]
		ifFalse: [aFrame receiveOnStream: (self getActiveStreamFor: aFrame)]]
	on: SocketPrimitiveFailed do: [self socketClosed]