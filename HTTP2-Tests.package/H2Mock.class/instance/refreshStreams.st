SqueakV5additions
refreshStreams
	"implemented for Squeak5, not necessary in Sq6"
	binary = self inStream isBinary ifFalse: [self resetInStream].
	binary = self outStream isBinary ifFalse: [self resetOutStream].