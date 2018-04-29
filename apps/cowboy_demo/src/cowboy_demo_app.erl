%%%-------------------------------------------------------------------
%% @doc cowboy_demo public API
%% @end
%%%-------------------------------------------------------------------

-module(cowboy_demo_app).

-behaviour(application).

%% Application callbacks
-export([start/2, stop/1]).

%%====================================================================
%% API
%%====================================================================

start(_StartType, _StartArgs) ->
    Dispatch = cowboy_router:compile([
        {'_', [{"/demo", cowboy_demo_handler, []}]}
    ]),
    {ok, _} = cowboy:start_clear(demo_http_listener,
        [{port, 8002}],
        #{env => #{dispatch => Dispatch}}
    ),
    cowboy_demo_sup:start_link().

%%--------------------------------------------------------------------
stop(_State) ->
    ok.

%%====================================================================
%% Internal functions
%%====================================================================
