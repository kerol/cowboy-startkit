%% coding: utf-8
%%%-------------------------------------------------------------------
%%% @author kerol
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 29. Apr 2018 10:59 PM
%%%-------------------------------------------------------------------
-module(cowboy_demo_handler).

%% API
-export([init/2]).

init(Req0, State) ->
    Req = cowboy_req:reply(200,
        #{<<"content-type">> => <<"text/plain">>},
        <<"Hello Erlang! -- from app demo">>,
        Req0),
    {ok, Req, State}.
