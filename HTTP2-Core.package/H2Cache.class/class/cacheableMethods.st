constants
cacheableMethods

	"https://tools.ietf.org/html/rfc7231#section-4.2.3
	POST is not included even though it MAY be cacheable"
	^ #( 'GET' . 'HEAD' )