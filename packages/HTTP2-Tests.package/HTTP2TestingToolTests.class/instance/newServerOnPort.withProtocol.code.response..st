testing
newServerOnPort:port withProtocol: protocol code: code response: response
	|server|
	server := WebServer newForUrl: 'localhost'.
	server listenOn: port.
	server addService: '/' action: [:req | 
		|resp| 
		resp := req newResponse protocol: protocol code:code.  
		req sendResponse: resp content: response.].
	^ server