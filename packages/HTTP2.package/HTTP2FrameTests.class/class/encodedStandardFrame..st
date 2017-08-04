encoded test-frames
encodedStandardFrame: type
	^ #[16r00 16r00 16r04], 
		type asByteArray, 
		#[16r00 16r00 16r00 16r00 16r0d 16r00 16r00 16r00 
			16r2a]
	