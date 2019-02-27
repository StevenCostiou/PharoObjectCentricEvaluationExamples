Class {
	#name : #OCEEvaluation,
	#superclass : #Object,
	#instVars : [
		'instrumenter'
	],
	#category : #ObjectCentricEvaluationExamples
}

{ #category : #scripts }
OCEEvaluation class >> evaluateAll [
	<script>
	|reference anonClasses ghost talents reflectivity changeDetector results|
	reference := self evaluateNonInstrumented.
	Smalltalk garbageCollect.
	anonClasses := self evaluateAnonsubclasses.
	Smalltalk garbageCollect.
	ghost := self evaluateGhost.
	Smalltalk garbageCollect.
	talents := self evaluateTalents.
	Smalltalk garbageCollect.
	reflectivity := self evaluateReflectivity.
	Smalltalk garbageCollect.
	changeDetector := self evaluateChangeDetector.
	results := Dictionary new.
	results at: 'Reference' put: {reference. reference/reference. }.	
	results at: 'Anonymous Classes' put: {anonClasses. (anonClasses/reference) asFloat }.
	results at: 'Ghost' put: {ghost. (ghost/reference) asFloat }.
	results at: 'MetaLink' put: {reflectivity. (reflectivity/reference) asFloat }.
	results at: 'Talents' put: {talents. (talents/reference) asFloat }.	
	results at: 'Change Detector' put: {changeDetector. (changeDetector/reference) asFloat  }.
	results inspect
]

{ #category : #scripts }
OCEEvaluation class >> evaluateAnonsubclasses [
	<script>
	^self new evaluateAnonsubclasses
]

{ #category : #scripts }
OCEEvaluation class >> evaluateChangeDetector [
	<script>
	^self new evaluateChangeDetector
]

{ #category : #scripts }
OCEEvaluation class >> evaluateGhost [
	<script>
	^self new evaluateGhost
]

{ #category : #scripts }
OCEEvaluation class >> evaluateNonInstrumented [
	<script>
	^self new evaluateOverheadFor: OCEManuallyInstrumentedPerson new
]

{ #category : #scripts }
OCEEvaluation class >> evaluateReflectivity [
	<script>
	^self new evaluateReflectivity
]

{ #category : #scripts }
OCEEvaluation class >> evaluateTalents [
	<script>
	^self new evaluateTalents
]

{ #category : #evaluation }
OCEEvaluation >> evaluateAnonsubclasses [
	| person anonClass result |
	person := OCEPerson new.
	anonClass := instrumenter instrumentWithAnonymousClass: person.
	result := self evaluateOverheadFor: person.
	instrumenter removeAnonymousClassInstrumentation: anonClass from: person.
	^ result
]

{ #category : #evaluation }
OCEEvaluation >> evaluateChangeDetector [
	| person result |
	person := OCEPerson new.
	instrumenter instrumentWithReadOnly: person.
	result := self evaluateOverheadFor: person.
	instrumenter removeReadOnlyInstrumentationFrom: person.
	^ result
]

{ #category : #evaluation }
OCEEvaluation >> evaluateGhost [
	| person proxy result |
	person := OCEPerson new.
	proxy := instrumenter instrumentWithGhost: person.
	result := self evaluateOverheadFor: person.
	instrumenter removeGhostInstrumentation: proxy from: person.
	^ result
]

{ #category : #evaluation }
OCEEvaluation >> evaluateOverheadFor: aPerson [
	^ [ 100000000 timesRepeat: [ aPerson name: 'eval' ] ] timeToRun
]

{ #category : #evaluation }
OCEEvaluation >> evaluateReflectivity [
	| person proxy result |
	person := OCEPerson new.
	proxy := instrumenter instrumentWithReflectivity: person.
	result := self evaluateOverheadFor: person.
	instrumenter removeReflectivityInstrumentation: proxy from: person.
	^ result
]

{ #category : #evaluation }
OCEEvaluation >> evaluateTalents [
	| person talent result |
	person := OCEPerson new.
	talent := instrumenter instrumentWithTalent: person.
	result := self evaluateOverheadFor: person.
	instrumenter removeTalentInstrumentation: talent from: person.
	^ result
]

{ #category : #initalize }
OCEEvaluation >> initialize [
	super initialize.
	instrumenter := OCEInstrumenter new 
]
