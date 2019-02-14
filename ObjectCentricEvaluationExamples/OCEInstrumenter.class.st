Class {
	#name : #OCEInstrumenter,
	#superclass : #Object,
	#category : #ObjectCentricEvaluationExamples
}

{ #category : #'as yet unclassified' }
OCEInstrumenter class >> instrumentWithTalent: anObject [
	|talent|
	talent := Trait named: 'MyTalent'.
	talent
		compile:
			'name: aName
	self tag: aName.
	name := aName'.
	anObject addTalent: talent.
	^talent
]
