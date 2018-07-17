class initialization
newFrom:  aWebRequest with: contentBlock
	^ H2Request new
		header: (H2Header newFrom: aWebRequest);
		data: (self contentAsString: contentBlock);
		yourself