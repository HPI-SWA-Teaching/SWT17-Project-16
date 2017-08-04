testConnection
testConnection
	| url response |
	url := (FillInTheBlank request: 'Enter an URL.').
	response := WebClient httpRequest: 'GET' url: 'http://', url
		headers: 'Connection: Upgrade, HTTP2-Settings',Character cr,Character lf,'Upgrade: h2c', 	Character cr, Character lf, 'HTTP2-Settings: AAMAAABkAAQAAP__'
		content: nil response: [:resp|].
	^ response contents beginsWith: 'HTTP/1.1 101 Switching Protocols'
	