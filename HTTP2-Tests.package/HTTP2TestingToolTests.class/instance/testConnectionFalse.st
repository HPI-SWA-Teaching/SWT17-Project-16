testing
testConnectionFalse
	| server port |
	port := self port.
	server := self newServerOnPort: port withProtocol: 'HTTP/1.1' code: 302 response: 'Moved Permanently to https://localhost'.
	self deny: (HTTP2TestingTool testConnection: 'localhost' port: port).
	server destroy