-module(mnesia_adapter).

-export([install/2,install/4]).
-export([transaction/1,upsert/1,upsert_sync/1,insert/1,insert_sync/1,delete/1,find/1,command/1]).

install(Table,Attributes) ->
	Nodes = [node()],
	install(Table,
			Attributes,
			Nodes,
			[{disc_copies, Nodes},
			 {type, set}]).

install(Table,Attributes,Nodes,Options) ->
	mnesia:create_schema(Nodes),
	rpc:multicall(Nodes, application, start, [mnesia]),
	mnesia:start(),
	mnesia:create_table(Table, [{attributes, Attributes}
							   |Options]),
	rpc:multicall(Nodes, application, stop, [mnesia]),
	ok.

find({Table,Id}) ->
	mnesia:read({Table,Id}).

upsert(Record) ->
	mnesia:write(Record).

transaction(Function) when erlang:is_function(Function)->
	Result=mnesia:transaction(Function),
	case Result of
		{atomic,Value} ->
			Value;
		_ ->
			error(Result)
	end.

upsert_sync(_Record) ->
	throw(not_implemented).

insert(_Record) ->
	throw(not_implemented).

insert_sync(_Record)->
	throw(not_implemented).

delete(_Record) ->
	throw(not_implemented).

command(_Command) ->
	throw(not_implemented).