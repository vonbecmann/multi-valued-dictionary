tests - set arithmetic
testIntersectionBasic
	"self debug: #testIntersectionBasic"
	| inter |
	inter := self collection intersection: (self newEmptyDict add: self anotherElementOrAssociationIn; yourself).
	self deny: inter isEmpty.
	self assert: (inter includesAll: (self wrap: self anotherElementOrAssociationIn value))