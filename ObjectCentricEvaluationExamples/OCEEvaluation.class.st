Class {
	#name : #OCEEvaluation,
	#superclass : #Object,
	#instVars : [
		'instrumenter'
	],
	#category : #ObjectCentricEvaluationExamples
}

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
OCEEvaluation class >> evaluateTalents [
	<script>
	^self new evaluateTalents
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
	| execTimes |
	execTimes := OrderedCollection new.
	execTimes
		add: [ 1000000 timesRepeat: [ aPerson name: 'eval' ] ] timeToRun.
	^ execTimes average
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
