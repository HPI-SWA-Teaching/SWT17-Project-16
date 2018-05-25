accessing
h2Session
	h2Session ifNil:[
		h2Session := H2Session establishConnectionTo: self serverName.].
	^ h2Session
