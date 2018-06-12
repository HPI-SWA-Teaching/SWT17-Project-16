receiving
process: aFrame
	
	self stream headerStreamIn nextPutAll: aFrame payload.
	aFrame flags endHeaders ifTrue: [ self stream headerCompleted ]