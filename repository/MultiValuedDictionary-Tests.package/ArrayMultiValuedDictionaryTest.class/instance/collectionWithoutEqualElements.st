requirements
collectionWithoutEqualElements
	^ self newEmptyDict
		add: #a -> {0 . 1};
		add: #b -> #(2 3);
		add: #c -> {4 . 5};
		yourself