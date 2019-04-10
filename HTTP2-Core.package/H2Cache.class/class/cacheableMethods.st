constants
cacheableMethods

	"https://tools.ietf.org/html/rfc7231#section-4.2.3
	POST is not included even though it MAY be cacheable
	HEAD is not included as whether you can use get responses as responses to head requests is not clear yet"
	^ #( 'GET' )