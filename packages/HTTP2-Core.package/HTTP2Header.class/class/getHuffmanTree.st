instance creation
getHuffmanTree
| lengths values root |

root := PrefixTreeNode new.
lengths := self getHuffmanRFCLengthCollection.
values := self getHuffmanRFCValueCollection.

values keysAndValuesDo: [ :key :value|
	root setValue: key For: value with: (1 << ((lengths at: key ) - 1))
	]. 

 ^ root