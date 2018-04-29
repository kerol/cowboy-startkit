%%%-------------------------------------------------------------------
%% @doc hello public API
%% @end
%%%-------------------------------------------------------------------

-module(hello_app).

-behaviour(application).

%% Application callbacks
-export([start/2, stop/1]).

%%====================================================================
%% API
%%====================================================================

start(_StartType, _StartArgs) ->
    Dispatch = cowboy_router:compile([
        {'_', [{"/hello", hello_handler, []}]}
    ]),
    {ok, _} = cowboy:start_clear(hello_http_listener,
        [{port, 8003}],
        #{env => #{dispatch => Dispatch}}
    ),
    hello_sup:start_link().

%%--------------------------------------------------------------------
stop(_State) ->
    ok.

%%====================================================================
%% Internal functions
%%====================================================================
