encoding
constructPayload 
	^ self streamDependencyBytes,
		(ByteArray with: self weight)