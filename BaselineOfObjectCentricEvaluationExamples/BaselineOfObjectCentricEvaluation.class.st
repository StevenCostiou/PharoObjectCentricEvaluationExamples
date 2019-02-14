Class {
	#name : #BaselineOfObjectCentricEvaluation,
	#superclass : #BaselineOf,
	#category : #BaselineOfObjectCentricEvaluationExamples
}

{ #category : #baselines }
BaselineOfObjectCentricEvaluation class >> baseline: spec [
	<baseline>
	spec
		for: #common
		do: [ 	spec baseline: 'Talents' 
				with: [ spec repository: 'github://tesonep/pharo-talents/src' ].
			spec blessing: #baseline.
			spec repository: 'github://StevenCostiou/PharoObjectCentricEvaluationExamples'.
			spec description: 'Evaluation scripts and examples for Pharo object-centric instrumentation'.
spec package: 'ObjectCentricEvaluationExamples'. ]
]
