Class {
	#name : #OCEInstrumenter,
	#superclass : #Object,
	#category : #ObjectCentricEvaluationExamples
}

{ #category : #'anonymous classes' }
OCEInstrumenter >> instrumentWithAnonymousClass: anObject [
	|anonClass|
	anonClass := anObject class newAnonymousSubclass.
	anonClass
		compile:
			'name: aName
				self tag: aName.
				name := aName'.
	anonClass adoptInstance: anObject.
	^anonClass
]

{ #category : #talents }
OCEInstrumenter >> instrumentWithTalent: anObject [
	|talent|
	talent := Trait new.
	talent
		compile:
			'name: aName
	self tag: aName.
	name := aName'.
	anObject addTalent: talent.
	^talent
]

{ #category : #'anonymous classes' }
OCEInstrumenter >> removeAnonymousClassInstrumentation: anonClass from: anObject [
	anonClass superclass adoptInstance: anObject
]

{ #category : #talents }
OCEInstrumenter >> removeTalentInstrumentation: talent from: anObject [
	anObject removeTalent: talent
]
