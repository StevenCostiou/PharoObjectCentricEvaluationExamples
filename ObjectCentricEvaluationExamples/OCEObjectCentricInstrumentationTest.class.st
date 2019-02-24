"
These tests prove that the instrumentation work and is object-centric.

Two instance of OCEPerson are created and each time only one of them is instrumented.
"
Class {
	#name : #OCEObjectCentricInstrumentationTest,
	#superclass : #TestCase,
	#instVars : [
		'p1',
		'p2',
		'instrumenter'
	],
	#category : #ObjectCentricEvaluationExamples
}

{ #category : #running }
OCEObjectCentricInstrumentationTest >> assertObjectCentricInstrumentation [
	p1 name: 'Worf'.	
	p2 name: 'Dax'.
	self assert: p1 tag isNil.
	self assert: p2 tag equals: 'Dax'
]

{ #category : #running }
OCEObjectCentricInstrumentationTest >> assertObjectCentricInstrumentationRemoval [
	p2 name: 'Jadzia'.
	self assert: p2 tag equals: 'Dax'
]

{ #category : #running }
OCEObjectCentricInstrumentationTest >> setUp [
	p1 := OCEPerson new.
	p2 := OCEPerson new.
	instrumenter := OCEInstrumenter new
]

{ #category : #running }
OCEObjectCentricInstrumentationTest >> tearDown [
	p1 := OCEPerson new.
	p2 := OCEPerson new
]

{ #category : #running }
OCEObjectCentricInstrumentationTest >> testAnonymousClassInstrumentation [
	|instrumentation|
	instrumentation := instrumenter instrumentWithAnonymousClass: p2.
	self assertObjectCentricInstrumentation.
	instrumenter removeAnonymousClassInstrumentation: instrumentation from: p2.
	self assertObjectCentricInstrumentationRemoval
]

{ #category : #running }
OCEObjectCentricInstrumentationTest >> testGhosttInstrumentation [
	|instrumentation|
	instrumentation := instrumenter instrumentWithGhost: p2.
	self assertObjectCentricInstrumentation.
	instrumenter removeGhostInstrumentation: instrumentation from: p2.
	self assertObjectCentricInstrumentationRemoval
]

{ #category : #running }
OCEObjectCentricInstrumentationTest >> testReadOnlyInstrumentation [
	instrumenter instrumentWithReadOnly: p2.
	self assertObjectCentricInstrumentation.
	instrumenter removeReadOnlyInstrumentationFrom: p2.
	self assertObjectCentricInstrumentationRemoval
]

{ #category : #running }
OCEObjectCentricInstrumentationTest >> testReflectivityInstrumentation [
	|instrumentation|
	instrumentation := instrumenter instrumentWithReflectivity: p2.
	self assertObjectCentricInstrumentation.
	instrumenter removeReflectivityInstrumentation: instrumentation from: p2.
	self assertObjectCentricInstrumentationRemoval
]

{ #category : #running }
OCEObjectCentricInstrumentationTest >> testTalentInstrumentation [
	|instrumentation|
	instrumentation := instrumenter instrumentWithTalent: p2.
	self assertObjectCentricInstrumentation.
	instrumenter removeTalentInstrumentation: instrumentation from: p2.
	self assertObjectCentricInstrumentationRemoval
]
