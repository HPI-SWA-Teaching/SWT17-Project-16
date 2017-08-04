initializing
newServerOnPort: port withProtocol: protocol code: code response: response
	| resp | 
	^ (WebServer newForUrl: 'localhost')
		listenOn: port;
		addService: '/' action: [:req | 
			resp := req newResponse protocol: protocol code:code.  
			req sendResponse: resp content: response];
		yourself 