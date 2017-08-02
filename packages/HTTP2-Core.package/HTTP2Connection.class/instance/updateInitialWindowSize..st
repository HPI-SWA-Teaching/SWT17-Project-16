updatingSettings
updateInitialWindowSize: anInteger
	self initialWindowSize > anInteger
		ifTrue: [self activeStreams do: [:stream |
				stream updateWindowSize: anInteger - self initialWindowSize]].
	self updateWindowSize: anInteger - self initialWindowSize.
	self initialWindowSize: anInteger