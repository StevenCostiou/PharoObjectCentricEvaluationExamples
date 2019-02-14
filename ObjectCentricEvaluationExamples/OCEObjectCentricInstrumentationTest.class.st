Class {
	#name : #OCEObjectCentricInstrumentationTest,
	#superclass : #TestCase,
	#instVars : [
		'p1',
		'p2'
	],
	#category : #ObjectCentricEvaluationExamples
}

{ #category : #instrumentation }
OCEObjectCentricInstrumentationTest >> installInstrumentation [
	self subclassResponsibility 
]

{ #category : #running }
OCEObjectCentricInstrumentationTest >> setUp [
	p1 := OCEPerson new.
	p2 := OCEPerson new.
	self installInstrumentation
]

{ #category : #running }
OCEObjectCentricInstrumentationTest >> tearDown [
	self uninstallInstrumentation.
	p1 := OCEPerson new.
	p2 := OCEPerson new
]

{ #category : #running }
OCEObjectCentricInstrumentationTest >> testObjectCentricInstrumentation [
	p1 name: 'Worf'.
	p2 name: 'Dax'.
	self assert: p1 tag isNil.
	self assert: p2 tag equals: 'Dax'
]

{ #category : #instrumentation }
OCEObjectCentricInstrumentationTest >> uninstallInstrumentation [
	self subclassResponsibility
]
