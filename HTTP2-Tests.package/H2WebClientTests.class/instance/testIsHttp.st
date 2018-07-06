testing
testIsHttp

	webclient registerProtocol: #h2c for: self class exampleServer. 
	self assert: [(webclient knownAsHttp: self class exampleServer) not].
	
	webclient registerProtocol: #h2 for: self class exampleServer. 
	self assert: [(webclient knownAsHttp: self class exampleServer) not].
	
	webclient registerProtocol: 'http/1.1' asSymbol for: self class exampleServer. 
	self assert: [webclient knownAsHttp: self class exampleServer]