accessing
size
	| tally |
	tally := 0.
	self
		associationsDo: [ :assoc | 
			tally := tally
				+
					(assoc value isCollection
						ifTrue: [ assoc value size ]
						ifFalse: [ 1 ]) ].
	^ tally