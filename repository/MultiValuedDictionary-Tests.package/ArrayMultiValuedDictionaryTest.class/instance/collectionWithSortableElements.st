requirements
collectionWithSortableElements
	" return a collection elements that can be sorte ( understanding message ' < '  or ' > ')"

	^ self newEmptyDict
		add: #a -> {3 . 5};
		add: #b -> {4 . 8};
		add: #c -> {7 . 11};
		add: #d -> {6 . 12};
		add: #e -> {9 . 10};
		yourself