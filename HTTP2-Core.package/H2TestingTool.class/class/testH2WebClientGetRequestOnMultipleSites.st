testH2WebClient
testH2WebClientGetRequestOnMultipleSites
	| WC  responses block |
	block :=  [:s| Transcript show: s asString].
	responses := OrderedCollection new.
	WC := H2WebClient new.
	responses add: (WC httpGet: 'http://localhost' do: block). 
	responses add: (WC httpGet: 'https://www.google.de' do: block). 
	responses add: (WC httpGet: 'http://localhost' do: block). 
	responses add: (WC httpPost:'http://localhost' content: 'textekjafnk' type: 'text'  do:  block). 
	responses add: (WC httpGet: 'http://localhost' do: block).
	responses add: (WC httpGet: 'https://www.google.de' do: block). 
	
	^ responses
	

	