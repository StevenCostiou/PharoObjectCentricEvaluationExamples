Class {
	#name : #OCEInstrumenter,
	#superclass : #Object,
	#category : #ObjectCentricEvaluationExamples
}

{ #category : #talents }
OCEInstrumenter >> instrumentWithTalent: anObject [
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

{ #category : #talents }
OCEInstrumenter >> removeTalentInstrumentation: talent from: anObject [
	anObject removeTalent: talent
]
