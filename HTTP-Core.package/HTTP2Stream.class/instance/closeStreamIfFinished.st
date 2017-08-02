closing
closeStreamIfFinished
	(self sender atEnd and: self receiver atEnd) ifTrue:
		[self streamManager closeStream: self]