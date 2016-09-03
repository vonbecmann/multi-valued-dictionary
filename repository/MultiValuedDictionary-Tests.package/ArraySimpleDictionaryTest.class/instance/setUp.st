running
setUp
	nonEmptyDict := (self newEmptyDict)
		add: #a -> self elementTwiceIn;
		add: #b -> 30;
		add: #c -> self elementTwiceIn;
		add: #d -> -2;
		yourself.
	duplicatedElement := 2.5