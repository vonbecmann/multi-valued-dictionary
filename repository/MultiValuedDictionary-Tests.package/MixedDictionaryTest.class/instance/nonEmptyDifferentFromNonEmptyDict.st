requirements
nonEmptyDifferentFromNonEmptyDict
	" return a dictionary for which all keys are not included in nonEmptyDict"

	^ self newEmptyDict
		add: #h -> 101;
		add: #i -> #(102 103);
		add: #j -> {104 . 105};
		add: #k -> {106 . 107};
		add: #l -> 108;
		yourself