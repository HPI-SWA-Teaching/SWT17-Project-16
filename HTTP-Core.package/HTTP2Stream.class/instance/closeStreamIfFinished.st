closing
closeStreamIfFinished
	(self sender atEnd and: self receiver atEnd) ifTrue:
		[self connection closeStream: self]