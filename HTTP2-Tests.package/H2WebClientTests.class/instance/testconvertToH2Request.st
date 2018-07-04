as yet unclassified
testconvertToH2Request
	|wc H2request request  |
	wc:=H2WebClient new server: 'http://www.test.url'  .
	
	request := WebRequest new 
		initializeFromUrl: 'http://www.test.url/path/';
		method: 'GET';
		yourself.
	H2request := wc convertToH2Request: request  with: [:v|]. 
	
	self assert: ((H2request header at: ':method') = 'GET' ). 
	self assert: ((H2request header at: ':path') = '/path/' ). 
	self assert: ((H2request header at: ':authority') = 'http://www.test.url' ). 
	self assert: ((H2request header at: ':scheme') = 'http' ). 
	
	