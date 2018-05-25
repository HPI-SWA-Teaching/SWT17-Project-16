initialize
getPathFrom: anUrlString
	| urlStream path |
	urlStream := anUrlString readStream.
	"Skip past scheme if present"
	urlStream upToAll: '://'.
	urlStream atEnd 
		ifTrue:[path := anUrlString]
		ifFalse:[path := urlStream upTo: $/; upToEnd].
	(path beginsWith: '/') ifFalse:[path := '/', path].
	
	^ path