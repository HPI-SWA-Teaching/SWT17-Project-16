A H2DataFrameReceiver is the third receiving state a H2Stream is in. In this state, the stream receives all the data of the server response. If there is no data in the response, the stream goes directly into the final H2NullReceiver state.