tests - set arithmetic
testDifferenceWithNonNullIntersection
	"Answer the set theoretic difference of two collections."
	"self debug: #testDifferenceWithNonNullIntersection"
	"	#(1 2 3) difference: #(2 4) 
	->  #(1 3)"
	| res overlapping |
	overlapping := self newEmptyDict  
		add: self anotherElementOrAssociationNotIn;
		add: self anotherElementOrAssociationIn;
		yourself.
	res := self collection difference: overlapping.
	self deny: (res includes: self anotherElementOrAssociationIn).
	overlapping do: [ :each | self deny: (res includes: each) ]