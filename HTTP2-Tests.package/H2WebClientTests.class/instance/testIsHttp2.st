as yet unclassified
testIsHttp2

	webclient protocol: #h2c   for: self class exampleServer. 
	self assert: [webclient isHttp2: self class exampleServer .].
	webclient protocol: #h2   for: self class exampleServer. 
	self assert: [webclient isHttp2: self class exampleServer .].
	webclient protocol: 'http/1.1' asSymbol  for: self class exampleServer. 
	self assert: [(webclient isHttp2: self class exampleServer) not .]