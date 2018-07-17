A H2Cache is the cache used by the H2Session.
Normally a global instance is used but you can create your own instance of a H2Cache. This is particulary useful in tests involving a H2Session as otherwise the requests used in your tests would be stored in the global instance and reused in the following test runs.
