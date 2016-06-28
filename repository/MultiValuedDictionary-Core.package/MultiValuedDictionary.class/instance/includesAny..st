testing
includesAny: aCollection
	"Answer whether any element of aCollection is one of the receiver's elements."

	^ aCollection anySatisfy: [ :elem | self includes: elem ]