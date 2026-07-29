import canonicalLaneMathlib.PrincipalComponentsAxis

namespace HautevilleHouse
namespace FactorAnalysisPrincipalComponentsCorrespondenceCanonicalLaneLean

structure RotationMethod where
  orthogonal : Prop
  oblique : Prop
  varimaxCriterion : Prop
  promaxCriterion : Prop

def RotationClosed (R : RotationMethod) : Prop :=
  R.varimaxCriterion ∧ R.promaxCriterion

structure FactorInterpretation where
  simpleStructure : Prop
  crossLoadingsMinimized : Prop
  interpretable : Prop

def InterpretationEvidence (F : FactorInterpretation) : Prop :=
  F.simpleStructure ∧ F.crossLoadingsMinimized ∧ F.interpretable

end FactorAnalysisPrincipalComponentsCorrespondenceCanonicalLaneLean
end HautevilleHouse
