sending
nextFrame: anInteger
	"ingnore flowcontrol"
	"Todo: flowControl"
	^ self outQueue removeFirst encode