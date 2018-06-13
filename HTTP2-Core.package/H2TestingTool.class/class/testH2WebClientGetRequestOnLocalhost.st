testH2WebClient
testH2WebClientGetRequestOnLocalhost
	| WC  responses block |
	block :=  [:s| Transcript show: s asString].
	responses := OrderedCollection new.
	WC := H2WebClient new.
	responses add: (WC httpGet: 'http://localhost' do: block). 
	responses add: (WC httpGet: 'http://www.google.de' do: block). 
	responses add: (WC httpGet: 'http://localhost' do: block). 
	responses add: (WC httpGet: 'http://localhost' do: block).
	responses add: (WC httpGet: 'https://www.archlinux.org' do: block). 
	responses add: (WC httpGet: 'http://www.google.de' do: block). 
	
	^ responses
	

	