testing
isHttp2: aServerName
 ^ ((self serverProtocolDictionary at: aServerName) = #h2   or: [ (self serverProtocolDictionary at: aServerName) = #h2c ]) 