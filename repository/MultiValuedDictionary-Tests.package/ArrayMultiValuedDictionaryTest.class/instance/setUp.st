running
setUp
	nonEmptyDict := self newEmptyDict
		add: #a -> {1 . 'hello_world'};
		add: #b -> {2 . $2};
		add: #c -> {4 . 5};
		add: #d -> {6 . 7};
		add: #e -> {8 . 'nine'};
		yourself.
	duplicatedElement := 2.5