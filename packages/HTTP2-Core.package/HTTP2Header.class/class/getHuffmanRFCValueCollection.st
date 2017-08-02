instance creation
getHuffmanRFCValueCollection
| values | 

values := Dictionary new.
self getHuffmanRFCValueCollectionFirstPart: values.
self getHuffmanRFCValueCollectionSecondPart: values.
values at: 256 put: 67108846;
at: 257 put: 1073741823.

 ^ values