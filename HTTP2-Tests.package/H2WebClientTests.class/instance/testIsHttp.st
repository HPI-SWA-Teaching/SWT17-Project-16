as yet unclassified
testIsHttp

	webclient protocol: #h2c   for: self class exampleServer. 
	self assert: [(webclient isHttp: self class exampleServer) not ].
	webclient protocol: #h2   for: self class exampleServer. 
	self assert: [(webclient isHttp: self class exampleServer) not ].
	webclient protocol: 'http/1.1' asSymbol  for: self class exampleServer. 
	self assert: [(webclient isHttp: self class exampleServer) ]