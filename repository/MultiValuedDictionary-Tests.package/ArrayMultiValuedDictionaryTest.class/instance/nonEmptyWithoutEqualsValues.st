requirements
nonEmptyWithoutEqualsValues
	" return a dictionary that doesn't include equal values'"

	^ self newEmptyDict
		add: #a -> {3 . 5};
		add: #b -> {4 . 8};
		add: #c -> {7 . $s};
		add: #d -> {6 . $e};
		add: #e -> {9 . 10};
		yourself