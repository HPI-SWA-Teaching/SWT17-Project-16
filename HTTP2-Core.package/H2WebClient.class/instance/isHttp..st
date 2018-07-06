testing
isHttp: aServerName
 ^ (self serverProtocolDictionary at: aServerName) = 'http/1.1' asSymbol   