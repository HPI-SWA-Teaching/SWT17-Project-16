methods
h2cGet: anUrlString do: aBlock 

	| request |
	request := self h2Session newRequestFor: (self getPathFrom: anUrlString).
	aBlock value: request.
	^ self h2Session newH2WebResponseFor: (self h2Session send: request).