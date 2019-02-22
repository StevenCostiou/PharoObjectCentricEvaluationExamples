"
Manually instrumented class to compute a reference execution time when evaluating object-centric instrumentation techniques.

The name: method is rewritten with the same instruction that the object-centric instrumentation must provide. When the name: method is executed and before storing the value passed as parameter into the name instance variables, it sends the #tag: message to the current object, with the parameter that was given to the name: method. 
"
Class {
	#name : #OCEManuallyInstrumentedPerson,
	#superclass : #OCEPerson,
	#category : #ObjectCentricEvaluationExamples
}

{ #category : #accessing }
OCEManuallyInstrumentedPerson >> name: aName [
	self tag: aName.
	name := aName
]
