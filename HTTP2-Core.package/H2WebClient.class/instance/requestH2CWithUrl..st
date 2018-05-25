initialize
requestH2CWithUrl: anUrlString

	| request | 
		request := self requestWithUrl: anUrlString.
		request method: 'GET'.
		request addHeader: 'Connection' value: 'Upgrade,HTTP2-Settings'.
		request addHeader: 'Upgrade' value: 'h2c'.
		request addHeader: 'HTTP2-Settings' value: 'AAMAAABkAARAAAAAAAIAAAAA'.
		userAgent ifNotNil:[:ua | request headerAt: 'User-Agent' put: ua].
		self contentDecoders ifNotNil: [:decoders | request headerAt: 'Accept-Encoding' put: decoders]. 
		
		^ request .