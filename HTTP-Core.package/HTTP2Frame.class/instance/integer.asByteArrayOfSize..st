accessing
integer: anInteger asByteArrayOfSize: aSize
	"copied from Pharo 5"
	"Answer a ByteArray of aSize with my value, most-significant byte first."
	| answer digitPos |
	aSize < anInteger digitLength ifTrue: [ anInteger error: 'number to large for byte array' ].
	answer := ByteArray new: aSize.
	digitPos := 1.
	aSize 
		to: aSize - anInteger digitLength + 1
		by: -1
		do: 
			[ :pos | 
			answer 
				at: pos
				put: (anInteger digitAt: digitPos).
			digitPos := digitPos + 1 ].
	^ answer