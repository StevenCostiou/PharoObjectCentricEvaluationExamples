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
