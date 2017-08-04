# SWT17-Project-16 [![Build Status](https://travis-ci.org/HPI-SWA-Teaching/SWT17-Project-16.svg?branch=master)](https://travis-ci.org/HPI-SWA-Teaching/SWT17-Project-16)  [![Coverage Status](https://coveralls.io/repos/github/HPI-SWA-Teaching/SWT17-Project-16/badge.svg?branch=master)](https://coveralls.io/github/HPI-SWA-Teaching/SWT17-Project-16?branch=master)
## This project
We built a basic HTTP/2 implementation.
## Usage
At first you have to create an http2 session:
'''
HTTP2Session class>>establishConnectionTo:
'''.
After that, you can create new requests for this session and send it via the session:
'''
HTTP2Session>>send:
'''
