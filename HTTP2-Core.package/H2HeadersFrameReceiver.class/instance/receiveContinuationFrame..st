receiving
receiveContinuationFrame: aFrame
	
	"if endHeaders was not set"
	self transition: H2ContinuationFrameReceiver.
	self stream receiver receive: aFrame