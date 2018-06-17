receiving
receive: aFrame
	"overwrites the H2ReceivingState implementaion as the PushPromise States don't need the lastFlags property
	and should preserve them for when they return to the normal ReceivingStates.
	Also this can't be the last frame in a stream so no endStream handling necissary"
	
	self process: aFrame