initialize
sslConnect: stream to: lastServer
	"Do the SSL handshake, use SNI if available"
	(stream respondsTo: #sslConnectTo:withAlpnProtos: )
		ifTrue: [stream sslConnectTo: lastServer withAlpnProtos: (self class alpnProtocols) .
				stream ssl isAlpnSupported ifTrue: [self registerProtocol:  stream ssl alpnSelected asSymbol   for: self serverName]
											ifFalse: [self registerProtocol: 'http/1.1' asSymbol  for: self serverName ] 	]
		ifFalse: [stream sslConnect].