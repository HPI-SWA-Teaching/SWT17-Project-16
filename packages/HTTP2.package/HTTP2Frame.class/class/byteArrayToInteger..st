compatibility
byteArrayToInteger: aByteArray
	"this method is copied from ByteArray>>asInteger because Squeak versions 5.1 and older do not support ByteArray>>asInteger"
	"Convert me to an Integer, network byte order, most significant byte first, big endian"
	
	| integer |
	integer := 0.
	aByteArray withIndexDo: [ :each :index | 
		integer := integer + (each bitShift: (aByteArray size - index) * 8) ].
	^ integer