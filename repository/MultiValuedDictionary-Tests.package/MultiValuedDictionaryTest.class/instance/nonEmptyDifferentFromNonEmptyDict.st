requirements
nonEmptyDifferentFromNonEmptyDict
	" return a dictionary for which all keys are not included in nonEmptyDict"

	^ self newEmptyDict
		add: #h -> 101;
		add: #h -> 101.01;
		add: #i -> 102;
		add: #i -> 103;
		add: #j -> 104;
		add: #j -> 105;
		add: #k -> 106;
		add: #k -> 107;
		add: #l -> 108;
		add: #l -> 109;
		add: #l -> 109;
		yourself