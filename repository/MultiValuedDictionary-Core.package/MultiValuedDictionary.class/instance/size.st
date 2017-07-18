accessing
size
	"Answer how many elements the receiver contains."

	| tally |
	tally := 0.
	dictionary associationsDo: [ :assoc | tally := tally + assoc value size ].
	^ tally