accessing
size
	| tally |
	tally := 0.
	self associationsDo: [ :assoc | tally := tally + assoc value size ].
	^ tally