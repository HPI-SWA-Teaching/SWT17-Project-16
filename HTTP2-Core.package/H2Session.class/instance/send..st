sending
send: aRequest
	^ self cache getEntryFor: aRequest on: self server ifAbsent: [  self connection openStreamFor: aRequest ]