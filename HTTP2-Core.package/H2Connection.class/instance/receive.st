receiving
receive
	| aFrame|
	[aFrame := H2Frame readFrameFrom: self socketStream sized: self nextLength.
	aFrame receiveOnStream: (self streamFor: aFrame)]
		on: SocketPrimitiveFailed do: [self socketClosed]