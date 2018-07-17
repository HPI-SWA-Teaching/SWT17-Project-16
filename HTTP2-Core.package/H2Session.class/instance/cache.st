accessing
cache
	^ cache ifNil: [ cache := H2Cache instance ]