receiving
receiveContinuationFrame: aFrame

	"if endHeaders was not set"
	self transition: H2TrailerContinuationFrameReceiver.
	self stream receiver receive: aFrame