accessing
h2Session
	h2Session ifNil:[
		h2Session := H2Session newWithStream: stream at:  self serverName.].
	^ h2Session
