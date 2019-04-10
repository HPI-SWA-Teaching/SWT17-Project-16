receiving
receive: aFrame
	"overwrites the H2ReceivingState implementation as the PushPromise states don't need the lastFlags property
	and should preserve them for when they return to the normal ReceivingStates.
	Also this can't be the last frame in a stream so no endStream handling necessary"
	
	self process: aFrame