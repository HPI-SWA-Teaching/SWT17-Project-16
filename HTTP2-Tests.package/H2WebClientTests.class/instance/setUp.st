running
setUp

	webclient := H2WebClient new.
	mock := H2Mock on: String new. 
	mock lockStreamOf: webclient.