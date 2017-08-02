accessing
next: anInteger
	| resp |
	"simulate the waiting for data here"
	[(self inStream size < anInteger) and: self connectionActive] whileTrue:
		[(Delay forMilliseconds: 1) wait.].
	self connectionActive 
		ifTrue: [resp := (self inStream first: anInteger) asByteArray. self inStream removeFirst: anInteger.^resp]
		ifFalse: [SocketPrimitiveFailed signal: 'mock socket stream was closed'].