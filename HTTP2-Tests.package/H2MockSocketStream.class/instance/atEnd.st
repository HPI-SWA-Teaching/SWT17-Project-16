accessing
atEnd
	^ self inStream size = 0 and: self connectionActive not