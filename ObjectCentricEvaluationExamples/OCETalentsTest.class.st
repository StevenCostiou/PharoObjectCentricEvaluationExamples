Class {
	#name : #OCETalentsTest,
	#superclass : #OCEObjectCentricInstrumentationTest,
	#instVars : [
		'talent'
	],
	#category : #ObjectCentricEvaluationExamples
}

{ #category : #instrumentation }
OCETalentsTest >> installInstrumentation [
	talent := Trait named: 'MyTalent'.
	talent
		compile:
			'name: aName
	self tag: aName.
	name := aName'
]

{ #category : #instrumentation }
OCETalentsTest >> uninstallInstrumentation [
	p2 removeTalent: talent
]
