*HTTP2-Core
asByteArray
	"copied from Pharo 5 because Squeak versions 5.1 and older do not support this"
	| stream |
	stream := ByteArray new writeStream.
	self digitLength to: 1 by: -1 do: [:digitIndex |
		stream nextPut: (self digitAt: digitIndex)].
	^ stream contents