initializing
writeHeadersOn: aStream
	"Write the request"

	self header asOrderedCollection do:  [:value| aStream nextPutAll: value asString; crlf].
