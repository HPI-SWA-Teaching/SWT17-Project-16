as yet unclassified
lockStreamOf: aH2WebClient
	^aH2WebClient 
		instVarNamed: 'server' put: H2Mock mockServerName;
		instVarNamed: 'lastServer' put: H2Mock mockServerName;
		instVarNamed: 'lastPort' put: aH2WebClient serverPort;
		instVarNamed: 'lastScheme' put: 'http';	
		instVarNamed: 'stream' put: self; 
		yourself. 
	