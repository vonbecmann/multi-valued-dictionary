requirements
nonEmptyDifferentFromNonEmptyDict
	" return a dictionary for which all keys are not included in nonEmptyDict"

	^ (self newEmptyDict)
		add: self keyNotIn -> self valueNotIn;
		yourself