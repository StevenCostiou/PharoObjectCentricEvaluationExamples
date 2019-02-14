Class {
	#name : #OCEEvaluation,
	#superclass : #Object,
	#category : #ObjectCentricEvaluationExamples
}

{ #category : #scripts }
OCEEvaluation class >> evaluateNonInstrumented [
	<script>
	^self new evaluateOverheadFor: OCEPerson new
]

{ #category : #evaluation }
OCEEvaluation >> evaluateOverheadFor: aPerson [
  |execTimes|
  execTimes := OrderedCollection new.
  1 to: 1000 do:[:i|
    execTimes add: [aPerson name: i] timeToRun].
  ^execTimes average
]
