as yet unclassified
lockStreamOf: aH2WebClient on: aServerName
	^aH2WebClient instVarNamed: 'lastServer' put: aServerName;
	instVarNamed: 'lastPort' put: aH2WebClient serverPort;
	instVarNamed: 'lastScheme' put: 'http';
	yourself. 
	