instance creation
fromPayload: aPayload 
"aPayload size should be be <= SETTINGS_MAX_FRAME_SIZE (between 2^14 and 2^24-1)"
	^ self new
		payload: aPayload;
		yourself		

	