accessing
sslConnect: stream to: lastServer
	"Do the SSL handshake, use SNI if available"
	(stream respondsTo: #sslConnectTo:withAlpnProtos: )
		ifTrue: [stream sslConnectTo: lastServer withAlpnProtos: (Set  with: 'h2' with: 'http/1.1').
				stream ssl isAlpnSupported ifTrue: [ self serverProtocolDictionary at: self serverName put: stream ssl alpnSelected asSymbol ]
											ifFalse: [ self serverProtocolDictionary at: self serverName put: 'http/1.1' asSymbol ] 	]
		ifFalse: [stream sslConnect].