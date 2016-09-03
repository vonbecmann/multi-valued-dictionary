requirements
nonEmptyWithoutEqualsValues
	" return a dictionary that doesn't include equal values'"

	^ (self newEmptyDict)
		add: #a -> 5;
		add: #b -> 4;
		add: #c -> 7;
		add: #d -> 6;
		add: #e -> 9;
		yourself