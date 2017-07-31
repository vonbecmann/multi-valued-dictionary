running
setUp
	nonEmptyDict := self newEmptyDict
		add: #a -> 1;
		add: #a -> 'hello_world';
		add: #b -> 2;
		add: #b -> $2;
		add: #c -> 4;
		add: #c -> 5;		
		add: #d -> 6;
		add: #d -> 7;		
		add: #e -> 8;
		add: #e -> 'nine';				
		yourself.
	duplicatedElement := 2.5