running
setUp
	nonEmptyDict := (self newEmptyDict)
		add: #a -> 'hello_world';
		add: #b -> 2;
		add: #c -> {4 . 5};
		add: #d -> {6 . 7};
		add: #e -> 8;
		yourself.
	duplicatedElement := 2.5