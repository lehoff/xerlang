-module( crypto_square ).

-export( [encode/1] ).

encode( String ) ->
	Normalised = [X || X <- string:to_lower(String), is_letter(X)],
	Length = erlang:length( Normalised ),
	Square_root = math:sqrt( Length ),
	Width = width( Square_root, erlang:trunc(Square_root) ),
	Rows = rows( Length, Width, Normalised ),
	Queue = queue:from_list( Rows ),
	Transposed = first_in_each_row( queue:out(Queue) ),
	rows( Length, 5, Transposed ).


first_in_each_row( {empty, _Q} ) -> [];
first_in_each_row( {{value, [Character | Row]}, Q} ) ->
	   New_q = first_in_each_row_q( Row, Q ),
	   [Character | first_in_each_row( queue:out(New_q) )].

first_in_each_row_q( [], Q ) -> Q;
first_in_each_row_q( Row, Q ) -> queue:in( Row, Q ).

is_letter( C ) when C >= $a, C =< $z -> true;
is_letter( _C ) -> false.

rows( Length, Width, String ) when Length > Width ->
	{Row, Rest} = lists:split( Width, String ),
	[Row | rows( Length - Width, Width, Rest )];
rows( _Length, _Width, String ) -> [String].

width( Square_root, Trunc ) when Square_root > Trunc -> Trunc + 1;
width( _Square_root, Trunc ) -> Trunc.
