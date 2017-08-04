accessing
errorCodeDictionary
	errorCodeDictionary
		ifNil: [
			errorCodeDictionary := Dictionary new
				at: 16r0 put: 'NO_ERROR';
				at: 16r1 put: 'PROTOCOL_ERROR';
				at: 16r2 put: 'INTERNAL_ERROR';
				at: 16r3 put: 'FLOW_CONTROL_ERROR';
				at: 16r4 put: 'SETTINGS_TIMEOUT';
				at: 16r5 put: 'STREAM_CLOSED';
				at: 16r6 put: 'FRAME_SIZE_ERROR';
				at: 16r7 put: 'REFUSED_STREAM';
				at: 16r8 put: 'CANCEL';
				at: 16r9 put: 'COMPRESSION_ERROR';
				at: 16ra put: 'CONNECT_ERROR';
				at: 16rb put: 'ENHANCE_YOUR_CALM';
				at: 16rc put: 'INADEQUATE_SECURITY';
				at: 16rd put: 'HTTP_1_1_REQUIRED';
				yourself].
	^ typeDictionary