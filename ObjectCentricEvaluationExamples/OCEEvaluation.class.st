Class {
	#name : #OCEEvaluation,
	#superclass : #Object,
	#instVars : [
		'instrumenter'
	],
	#category : #ObjectCentricEvaluationExamples
}

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
OCEEvaluation >> evaluateOverheadFor: aPerson [
	| execTimes |
	execTimes := OrderedCollection new.
	1000
		timesRepeat: [ execTimes
				add: [ 1000000 timesRepeat: [ aPerson name: 'eval' ] ] timeToRun ].
	^ execTimes average
]

{ #category : #evaluation }
OCEEvaluation >> evaluateTalents [
	| person talent result |
	person := OCEPerson new.
	talent := instrumenter instrumentWithTalent: person.
	result := self evaluateOverheadFor: OCEPerson new.
	instrumenter removeTalentInstrumentation: talent from: person.
	^ result
]

{ #category : #initalize }
OCEEvaluation >> initialize [
	super initialize.
	instrumenter := OCEInstrumenter new 
]
