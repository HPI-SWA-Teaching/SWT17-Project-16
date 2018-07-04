accessing
convertToH2Request: aWebRequest with: contentBlock
	| request helperStream|
	helperStream:= ReadWriteStream on: ByteString new.
	contentBlock value: helperStream.
	helperStream reset.
	request := H2Request new.
	request header: H2Header new.
	request header
		add: ':method'-> (aWebRequest method);
		add: ':path' ->aWebRequest rawUrl;
		add: ':scheme' -> 'http';
		add: ':authority' ->self server .
		
	aWebRequest headersDo: [:key :value| request  header add: (key asLowercase) ->  value asString. ].
	request data: helperStream upToEnd.
	^ request