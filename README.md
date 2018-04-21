# HTTP/2 [![Build Status](https://travis-ci.org/hpi-swa-teaching/HTTP-2.svg?branch=developer)](https://travis-ci.org/hpi-swa-teaching/HTTP-2)  [![Coverage Status](https://coveralls.io/repos/github/hpi-swa-teaching/HTTP-2/badge.svg?branch=developer)](https://coveralls.io/github/hpi-swa-teaching/HTTP-2?branch=developer)
## This project
We built a basic HTTP/2 implementation. It covers most of the protocol specifications from ![RFC 7540 (HTTP/2)](https://tools.ietf.org/html/rfc7540) and ![RFC 7541 (HPACK)](https://tools.ietf.org/html/rfc7541).
## Usage
At first you have to create an http2 session (replace 'localhost' with the server you want to communicate with):
```
session := H2Session establishConnectionTo: 'localhost'
```
After that, you can create new requests aiming for specific resources on that server:
```
request := session newRequestFor: '/aDirectory/aResource/'
```
You can now add header fields and data to the request:
```
request headerAt: 'aKey' put: 'aValue'.
request data: 'some data'
```
After costumizing your request you can send it via the session. You will get a Promise for the response. This allows you to make requests asyncronously.
```
promise := session send: request
```
