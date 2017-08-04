receiving
receive
	| aFrame|
	[aFrame := H2Frame getFrameFrom: 
		(self socketStream next: self nextLength + H2Frame headerLength) asByteArray.
	(aFrame streamIdentifier = 0)
		ifTrue: [aFrame receiveOnStream: self controlStream]
		ifFalse: [aFrame receiveOnStream: (self getActiveStreamFor: aFrame)]]
	on: SocketPrimitiveFailed do: [self socketClosed]