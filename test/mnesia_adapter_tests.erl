-module(mnesia_adapter_tests).

-include("bdd.hrl").

setup() ->
	[].

teardown(_State) ->
	[].

mnesia_adapter_test_() ->
	[?Describe("Given something",
		[?It("Should do stuff",fun setup/0,fun teardown/1,
			?_test(begin 
						?assert(true)
					end))
		]),