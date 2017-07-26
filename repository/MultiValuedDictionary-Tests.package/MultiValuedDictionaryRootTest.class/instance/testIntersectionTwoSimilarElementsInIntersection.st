tests - set arithmetic
testIntersectionTwoSimilarElementsInIntersection
	"self debug: #testIntersectionBasic"
	| inter |
	inter := self collection intersection: (self newEmptyDict add: self anotherElementOrAssociationIn; yourself).
	self assert: (self collection occurrencesOf: self anotherElementOrAssociationIn) = self numberOfSimilarElementsInIntersection.
	self assert: (inter includes: self anotherElementOrAssociationIn value)