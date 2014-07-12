-module( robot_name_tests ).
-include_lib( "eunit/include/eunit.hrl" ).

boot_test() ->
              Robot = robot_name:create(),
	      Name = robot_name:ask( Robot ),
	      ?assert( erlang:length(Name) =:= 5 ),
	      [C1, C2, N1, N2, N3] = Name,
              ?assert( is_robot_character(C1) ),
	      ?assert( is_robot_character(C2) ),
	      ?assert( is_robot_number(N1) ),
              ?assert( is_robot_number(N2) ),
              ?assert( is_robot_number(N3) ).

reset_test() ->
	     Robot = robot_name:create(),
             Name1 = robot_name:ask( Robot ),
	     robot_name:reset( Robot ),
	     Name2 = robot_name:ask( Robot ),
	     ?assert( Name1 =/= Name2 ).



is_robot_character( C ) when C >= $A, C =< $Z -> true;
is_robot_character( _N ) -> false.

is_robot_number( N ) when N >= $0, N =< $9 -> true;
is_robot_number( _N ) -> false.
