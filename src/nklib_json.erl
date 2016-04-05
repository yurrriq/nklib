%% -------------------------------------------------------------------
%%
%% Copyright (c) 2014 Carlos Gonzalez Florido.  All Rights Reserved.
%%
%% This file is provided to you under the Apache License,
%% Version 2.0 (the "License"); you may not use this file
%% except in compliance with the License.  You may obtain
%% a copy of the License at
%%
%%   http://www.apache.org/licenses/LICENSE-2.0
%%
%% Unless required by applicable law or agreed to in writing,
%% software distributed under the License is distributed on an
%% "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
%% KIND, either express or implied.  See the License for the
%% specific language governing permissions and limitations
%% under the License.
%%
%% -------------------------------------------------------------------

%% @doc JSON Processing
-module(nklib_json).
-author('Carlos Gonzalez <carlosj.gf@gmail.com>').

-export([encode/1, encode_pretty/1, decode/1]).


%% ===================================================================
%% Types
%% ===================================================================




%% ===================================================================
%% Public
%% ===================================================================


%% @doc Encodes a term() to JSON
-spec encode(term()) ->
    binary() | error.

encode(Term) ->
    try
        json:to_binary(Term)
    catch
        error:Error ->
            lager:debug("Error encoding JSON: ~p", [Error]),
            error;
        throw:Error ->
            lager:debug("Error encoding JSON: ~p", [Error]),
            error
    end.


%% @doc Encodes a term() to JSON
-spec encode_pretty(term()) ->
    binary().

encode_pretty(Term) ->
    try
        json:prettify(json:to_binary(Term))
    catch
        error:Error ->
            lager:debug("Error encoding JSON: ~p", [Error]),
            error;
        throw:Error ->
            lager:debug("Error encoding JSON: ~p", [Error]),
            error
    end.


%% @doc Decodes a JSON as a map
-spec decode(binary()) ->
    term() | error.

decode(Term) ->
    try
        json:from_binary(Term)
    catch
        error:Error ->
            lager:debug("Error decoding JSON: ~p", [Error]),
            error;
        throw:Error ->
            lager:debug("Error decoding JSON: ~p", [Error]),
            error
    end.
