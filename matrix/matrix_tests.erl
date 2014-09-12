-module( matrix_tests ).
-include_lib("eunit/include/eunit.hrl").

empty_test() ->
	     Matrix = matrix:from_string( "" ),
	     ?assert( matrix:order(Matrix) =:= {0, 0} ),
	     ?assert( matrix:rows(Matrix) =:= [] ),
	     ?assert( matrix:columns(Matrix) =:= [] ).

square_test() ->
	      Matrix = matrix:from_string( "9 8 7\n5 3 2\n6 6 7" ),
	      ?assert( matrix:order(Matrix) =:= {3, 3} ),
	      ?assert( matrix:rows(Matrix) =:= [[9, 8, 7], [5, 3, 2], [6, 6, 7]] ),
	      ?assert( matrix:columns(Matrix) =:= [[9, 5, 6], [8, 3, 6], [7, 2, 7]] ).

only_row_test() ->
		Matrix = matrix:from_string( "1 2 3\n" ),
	        ?assert( matrix:order(Matrix) =:= {1, 3} ),
		?assert( matrix:rows(Matrix) =:= [[1, 2, 3]] ),
		?assert( matrix:columns(Matrix) =:= [[1], [2], [3]] ).

only_column_test() ->
         Matrix = matrix:from_string( "1\n2\n3\n" ),
	 ?assert( matrix:order(Matrix) =:= {3, 1} ),
         ?assert( matrix:rows(Matrix) =:= [[1], [2], [3]] ),
	 ?assert( matrix:columns(Matrix) =:= [[1, 2, 3]] ).
