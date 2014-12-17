-module( robot_name ).

-export( [ask/1, create/0, reset/1] ).

ask( Robot ) ->
      Robot ! {name, erlang:self()},
      receive
      {name, Answer} -> Answer
      end.

create() -> erlang:spawn( fun() -> loop( random_name() ) end ).

reset( Robot ) -> Robot ! reset.



loop( Name ) ->
      receive
      {name, Pid} ->
      	     Pid ! {name, Name},
	     loop( Name );
	reset -> loop( random_name() )
	end.

random_name() ->
	      C1 = random:uniform( 25 ) - 1 + $A,
              C2 = random:uniform( 25 ) - 1 + $A,
              N1 = random:uniform( 10 ) - 1 + $0,
              N2 = random:uniform( 10 ) - 1 + $0,
              N3 = random:uniform( 10 ) - 1 + $0,
	      [C1, C2, N1, N2, N3].
