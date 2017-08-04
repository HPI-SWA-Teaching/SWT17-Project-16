# SWT17-Project-16 [![Build Status](https://travis-ci.org/HPI-SWA-Teaching/SWT17-Project-16.svg?branch=master)](https://travis-ci.org/HPI-SWA-Teaching/SWT17-Project-16)  [![Coverage Status](https://coveralls.io/repos/github/HPI-SWA-Teaching/SWT17-Project-16/badge.svg?branch=master)](https://coveralls.io/github/HPI-SWA-Teaching/SWT17-Project-16?branch=master)
## This project
We built a basic HTTP/2 implementation. It covers most of the protocol specifications from ![RFC 7540 (HTTP/2)](https://tools.ietf.org/html/rfc7540) and ![RFC 7541 (HPACK)](https://tools.ietf.org/html/rfc7541).
## Usage
At first you have to create an http2 session (replace 'localhost' with the server you want to communicate with):
```
session := HTTP2Session establishConnectionTo: 'localhost'
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
