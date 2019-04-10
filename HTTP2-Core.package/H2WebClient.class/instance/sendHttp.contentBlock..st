private
sendHttp: aRequest contentBlock: aContentBlock
	"stream is instance variable in WebClient"
	self writeRequest: aRequest on: stream.
	aContentBlock value: stream.
	^ aRequest newResponse readFrom: stream