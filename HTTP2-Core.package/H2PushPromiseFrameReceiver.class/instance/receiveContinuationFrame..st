receiving
receiveContinuationFrame: aFrame
	
	"if endHeaders was not set"
	self transition: H2PushPromiseContinuationFrameReceiver.
	self stream receiver receive: aFrame