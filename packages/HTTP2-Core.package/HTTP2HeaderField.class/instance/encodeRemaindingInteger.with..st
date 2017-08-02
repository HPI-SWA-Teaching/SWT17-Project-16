encoding
encodeRemaindingInteger: anInteger with: prefix
	| solution |
	solution:= self calculateSolutionFor: anInteger - prefix index: 2 in: (ByteArray new: (anInteger log: 128) ceiling + 1).
	solution at: 1 put: prefix.
	^ solution