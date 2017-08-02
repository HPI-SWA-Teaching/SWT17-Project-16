requesting
nextFreeStreamIdPostIncrement
	self nextFreeStreamId: self nextFreeStreamId + 2.
	^ self nextFreeStreamId - 2.