-module( crypto_square_tests ).
-include_lib( "eunit/include/eunit.hrl" ).

encode1_test() -> ?assert( ["i"] =:= crypto_square:encode("I") ).

encode2_test() -> ?assert( ["ima"] =:= crypto_square:encode("I am") ).

encode_example1_test() ->
	      Plain_text = "If man was meant to stay on the ground, God would have given us roots.",
	      Cypher = ["imtgd","vsfea","rwerm","ayoog","oanou","uiont","nnlvt", "wttdd","esaoh","ghnss","eoau"],
	      ?assert( Cypher =:= crypto_square:encode(Plain_text) ).

encode_example2_test() ->
			Plain_text = "Have a nice day. Feed the dog & chill out!",
			Cypher1 = "hifei",
			Cypher2 = "acedl",
			Cypher = crypto_square:encode( Plain_text ),
			?assert( Cypher1 =:= lists:nth(1, Cypher) ),
			?assert( Cypher2 =:= lists:nth(2, Cypher) ).
