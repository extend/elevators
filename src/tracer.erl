%%%----------------------------------------------------------------------
%%% File    : tracer.erl
%%% Author  : Håkan Huss <hakan@erlang.ericsson.se>
%%% Purpose : Text-based event tracer that reports system events.
%%% Created :  4 Aug 1999 by Håkan Huss <hakan@erlang.ericsson.se>
%%%----------------------------------------------------------------------

-module(tracer).
-author('hakan@erlang.ericsson.se').
-vsn("1.0").

-behaviour(gen_event).

%% gen_event callbacks
-export([init/1, handle_event/2, handle_call/2, handle_info/2,
	 terminate/2, code_change/3]).

%%%----------------------------------------------------------------------
%%% Callback functions from gen_event
%%%----------------------------------------------------------------------

%%----------------------------------------------------------------------
%% init([])
%%  Initializes the event handler.
%%----------------------------------------------------------------------
init([]) ->
    {ok, []}.

%%----------------------------------------------------------------------
%% handle_event(Event, [])
%%  Prints info on the event that has occured.
%%  To be implemented...
%%----------------------------------------------------------------------
handle_event(Event, []) ->
    {ok, []}.

%%----------------------------------------------------------------------
%% handle_call not used
%%----------------------------------------------------------------------
handle_call(Request, State) ->
    Reply = ok,
    {ok, Reply, State}.

%%----------------------------------------------------------------------
%% handle_info not used
%%----------------------------------------------------------------------
handle_info(Info, State) ->
    {ok, State}.

%%----------------------------------------------------------------------
%% terminate has nothing to clean up.
%%----------------------------------------------------------------------
terminate(Reason, State) ->
    ok.

%%----------------------------------------------------------------------
%% code_change has no state to convert.
%%----------------------------------------------------------------------
code_change(_OldVsn, State, _Extra) ->
    {ok, State}.
