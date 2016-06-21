accessing
size
	| tally |
	tally := 0.
	self valuesDo: [ :each | tally := tally + 1 ].
	^ tally