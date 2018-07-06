private
convertToH2Request: aWebRequest with: contentBlock
	^ H2Request new
		header: (self h2HeaderFor: aWebRequest);
		data: (self contentAsStream: contentBlock) upToEnd;
		yourself.