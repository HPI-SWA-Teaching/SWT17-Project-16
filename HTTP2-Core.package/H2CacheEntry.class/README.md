A H2CacheEntry is an entry in a H2Cache.

Instance Variables
	expires:		<TimeStamp>
	promise:		<Promise>
	request:		<H2Request>
	server:		<String>

expires
	- time when the entry becomes invalid

promise
	- the cached response for the request

request
	- the request being cached

server
	- servername, as this is not a property of the request object
