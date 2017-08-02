instance creation
getHuffmanRFCLengthCollection
| lengths | 

lengths := Dictionary new.
self getHuffmanRFCLengthCollectionFirstPart: lengths.
self getHuffmanRFCLengthCollectionSecondPart: lengths.
lengths at: 257 put: 3.

 ^ lengths