*HTTP2-Core
from: aByteArray
	"converts aByteArray to an Integer using network byte order (most significant byte first, big endian)"
	
	| integer |
	integer := 0.
	aByteArray withIndexDo: [ :each :index | 
		integer := integer + (each bitShift: (aByteArray size - index) * 8) ].
	^ integer