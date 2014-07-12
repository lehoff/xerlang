-module( matrix ).

-export( [columns/1, from_string/1, order/1, rows/1] ).

columns( [] ) -> [];
columns( Matrix ) ->
	 {Row, Column} = order( Matrix ),
	 Q = queue:from_list( Matrix ),
	 Transposed = first_in_each_row( queue:out(Q) ),
	 rows( Row * Column, Row, Transposed ).

from_string( String ) -> [numerical_columns_from_row(X) || X <- rows_from_string(String)].

order( [] ) -> {0, 0};
order( [Row | _T]=Matrix ) -> {erlang:length(Matrix), erlang:length(Row)}.

rows( Matrix ) -> Matrix.



first_in_each_row( {empty, _Q} ) -> [];
first_in_each_row( {{value, [Character | Row]}, Q} ) ->
      New_q = first_in_each_row_q( Row, Q ),
      [Character | first_in_each_row( queue:out(New_q) )].

first_in_each_row_q( [], Q ) -> Q;
first_in_each_row_q( Row, Q ) -> queue:in( Row, Q ).

numerical_columns_from_row( Row ) -> [erlang:list_to_integer(X) ||  X <- string:tokens(Row, " ")].

rows( Length, Width, String ) when Length > Width ->
      {Row, Rest} = lists:split( Width, String ),
      [Row | rows( Length - Width, Width, Rest )];
rows( _Length, _Width, String ) -> [String].

rows_from_string( String ) -> string:tokens( String, "\n" ).