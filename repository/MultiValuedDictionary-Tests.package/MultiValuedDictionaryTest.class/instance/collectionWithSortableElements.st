requirements
collectionWithSortableElements
	" return a collection elements that can be sorte ( understanding message ' < '  or ' > ')"

	^ self newEmptyDict
		add: #a -> 3;
		add: #a -> 5;
		add: #b -> 4;
		add: #b -> 8;
		add: #c -> 7;
		add: #c -> 11;
		add: #d -> 6;
		add: #d -> 12;
		add: #e -> 9;
		add: #e -> 10;
		yourself