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
	^self new evaluateOverheadFor: OCEPerson new
]

{ #category : #scripts }
OCEEvaluation class >> evaluateTalents [
	<script>
	^self new evaluateTalents
]

{ #category : #evaluation }
OCEEvaluation >> evaluateOverheadFor: aPerson [
  |execTimes|
  execTimes := OrderedCollection new.
  1 to: 1000 do:[:i|
    execTimes add: [aPerson name: i] timeToRun].
  ^execTimes average
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
