initialize
close
	
	h2Session ifNotNil: [
		h2Session close.
		h2Session := nil.].
	super close.