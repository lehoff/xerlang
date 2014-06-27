-module( clock ).

-export( [create/2, is_equal/2, minutes_add/2, minutes_delete/2, to_string/1] ).

create( Hour, Minutes) when Hour >= 0, Hour < 24, Minutes >= 0, Minutes < 60 ->
	{Hour, Minutes, 0}.

is_equal( Clock1, Clock2 ) -> Clock1 =:= Clock2.

minutes_add( Clock, Minutes ) ->
	     Seconds = calendar:datetime_to_gregorian_seconds( {{0, 1, 2}, Clock} ),
	     Total = Seconds + 60 * Minutes,
	     {_Date, Time} = calendar:gregorian_seconds_to_datetime( Total ),
	     Time.

minutes_delete( Clock, Minutes ) -> minutes_add( Clock, negative_ignore_days(Minutes) ).

to_string( {Hour, Minutes, _Seconds} ) ->
	   lists:flatten( io_lib:format("~2.10.0b:~2.10.0b", [Hour, Minutes]) ).




negative_ignore_days( Minutes ) -> (Minutes * -1) rem (60 * 24).
