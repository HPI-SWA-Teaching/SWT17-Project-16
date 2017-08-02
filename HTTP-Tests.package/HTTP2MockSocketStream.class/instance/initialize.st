accessing
initialize
	self connectionActive: true.
	self inStream: OrderedCollection new.
	self outStream: (WriteStream on: ByteArray new).
	"shut down the mock socket stream after 5 seconds to prevent endless loops"
	[(Delay forSeconds: 5) wait.
	self connectionActive: false.] fork.