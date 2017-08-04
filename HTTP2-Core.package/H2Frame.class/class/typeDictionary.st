accessing
typeDictionary
	typeDictionary
		ifNil: [
			typeDictionary := Dictionary new
				at: 0 put: H2DataFrame;
				at: 1 put: H2HeadersFrame;
				at: 2 put: H2PriorityFrame;
				at: 3 put: H2RstStreamFrame;
				at: 4 put: H2SettingsFrame;
				at: 5 put: H2PushPromiseFrame;
				at: 6 put: H2PingFrame;
				at: 7 put: H2GoawayFrame;
				at: 8 put: H2WindowUpdateFrame;
				at: 9 put: H2ContinuationFrame;
				yourself].
	^ typeDictionary.