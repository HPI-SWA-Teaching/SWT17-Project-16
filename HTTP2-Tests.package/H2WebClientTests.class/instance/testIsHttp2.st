as yet unclassified
testIsHttp2

	webclient registerProtocol: #h2c for: self class exampleServer. 
	self assert: [webclient knownAsHttp2: self class exampleServer].
	
	webclient registerProtocol: #h2 for: self class exampleServer. 
	self assert: [webclient knownAsHttp2: self class exampleServer].
	
	webclient registerProtocol: 'http/1.1' asSymbol for: self class exampleServer. 
	self assert: [(webclient knownAsHttp2: self class exampleServer) not]