testing
isServer: aServerName registeredWithProtocolIn: protocolSet
	^ self serverProtocolDictionary at: aServerName
		ifPresent: [:protocol | protocolSet includes: protocol]
		ifAbsent: [false]