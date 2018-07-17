private
sendHttp2: aRequest contentBlock: aContentBlock
	^ self h2Session
		newH2WebResponseFor: (self h2Session
			send: (H2Request newFrom: aRequest with: aContentBlock))