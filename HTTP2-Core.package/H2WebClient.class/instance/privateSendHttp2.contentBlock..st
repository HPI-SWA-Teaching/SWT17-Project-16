private
privateSendHttp2: aRequest contentBlock: aContentBlock
	^ self h2Session
		newH2WebResponseFor: (self h2Session
			send: (self convertToH2Request: aRequest with: aContentBlock))