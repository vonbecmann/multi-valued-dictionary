requirements
integerCollectionWithoutEqualElements
	" return a collection of integer without equal elements"

	^ (self newEmptyDict)
		add: #a -> 5;
		add: #b -> 4;
		add: #c -> 7;
		add: #d -> 6;
		add: #e -> 9;
		yourself