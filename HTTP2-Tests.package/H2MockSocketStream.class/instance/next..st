accessing
next: anInteger
	"simulate the waiting for data here"
	[(self inStream size < anInteger) and: self connectionActive] whileTrue:
		[(Delay forMilliseconds: 1) wait.].
	self connectionActive 
		ifTrue: [^ (self inStream removeFirst: anInteger) asByteArray]
		ifFalse: [SocketPrimitiveFailed signal: 'mock socket stream was closed'].