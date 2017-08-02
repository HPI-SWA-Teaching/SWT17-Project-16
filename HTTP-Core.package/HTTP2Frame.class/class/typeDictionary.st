accessing
typeDictionary
	typeDictionary
		ifNil: [
			typeDictionary := Dictionary new
				at: 0 put: HTTP2DataFrame;
				at: 1 put: HTTP2HeadersFrame;
				at: 2 put: HTTP2PriorityFrame;
				at: 3 put: HTTP2RST_STREAMFrame;
				at: 4 put: HTTP2SettingsFrame;
				at: 5 put: HTTP2Push_PromiseFrame;
				at: 6 put: HTTP2PingFrame;
				at: 7 put: HTTP2GoawayFrame;
				at: 8 put: HTTP2Window_UpdateFrame;
				at: 9 put: HTTP2ContinuationFrame;
				yourself].
	^ typeDictionary.