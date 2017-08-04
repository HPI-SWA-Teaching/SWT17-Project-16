testing
testConnectionTrue
	| server port|
	port := self port.
	server := self newServerOnPort: port 
				   withProtocol: 'HTTP/1.1' 
				   code: 101
				   response: 'Switching Protocols'.
	self assert: (H2TestingTool testConnection: 'localhost' port: port).
	server destroy