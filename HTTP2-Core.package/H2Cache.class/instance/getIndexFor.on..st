helper methods
getIndexFor: aRequest on: server

	^ server,'|',(aRequest header at: ':path')