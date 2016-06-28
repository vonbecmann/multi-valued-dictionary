accessing
size
	"Answer how many elements the receiver contains."

	| tally |
	tally := 0.
	self
		associationsDo: [ :assoc | 
			tally := tally
				+
					(collectionClass == assoc value class
						ifTrue: [ assoc value size ]
						ifFalse: [ 1 ]) ].
	^ tally