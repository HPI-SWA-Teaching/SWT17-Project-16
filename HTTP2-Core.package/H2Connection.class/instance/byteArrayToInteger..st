compatiblity
byteArrayToInteger: aByteArray
	"Convert me to an Integer, network byte order, most significant byte first, big endian"
	
	| integer |
	integer := 0.
	aByteArray withIndexDo: [ :each :index | 
		integer := integer + (each bitShift: (aByteArray size - index) * 8) ].
	^ integer