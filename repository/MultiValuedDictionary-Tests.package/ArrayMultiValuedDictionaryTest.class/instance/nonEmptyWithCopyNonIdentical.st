requirements
nonEmptyWithCopyNonIdentical
	" return a collection including elements for which copy is not identical to the initial element ( this is not the case of Integer )"

	^ self newEmptyDict
		add: #A -> #(2.5 2.51);
		add: #b -> #(3.5 3.72);
		yourself