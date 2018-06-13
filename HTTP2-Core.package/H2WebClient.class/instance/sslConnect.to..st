accessing
sslConnect: stream to: lastServer
	"Do the SSL handshake, use SNI if available"
	(stream respondsTo: #sslConnectTo:)
		ifTrue: [stream sslConnectTo: lastServer withAlpnProtos: (Set with: 'HTTP/1.1' with: 'h2').
				stream ssl isAlpnSupported ifTrue: [ self serverProtocolDictionary at: self serverName put: stream ssl alpnProtos asSymbol ]
											ifFalse: [ self serverProtocolDictionary at: self serverName put: 'HTTP/1.1' asSymbol ] 	]
		ifFalse: [stream sslConnect].