requirements
collectionWithoutEqualElements
	^ self newEmptyDict
		add: #a -> 1;
		add: #b -> 2;
		add: #b -> 3;
		add: #c -> 4;
		add: #c -> 5;
		yourself