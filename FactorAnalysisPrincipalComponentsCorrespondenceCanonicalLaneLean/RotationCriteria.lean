import FactorAnalysisPrincipalComponentsCorrespondenceCanonicalLaneLean.VarianceExtraction

namespace HautevilleHouse
namespace FactorAnalysisPrincipalComponentsCorrespondenceCanonicalLaneLean

structure RotationPackage {L : FactorLoadingPackage}
    {V : VarianceExtractionPackage L} where
  orthogonalRotation : Prop
  obliqueRotation : Prop
  varimaxCriterion : Prop
  quartiminCriterion : Prop
  rotationIdentifiability : Prop

structure RotationEvidence {L : FactorLoadingPackage}
    {V : VarianceExtractionPackage L} (R : RotationPackage V) where
  orthogonalRotationClosed : R.orthogonalRotation
  obliqueRotationClosed : R.obliqueRotation
  varimaxCriterionClosed : R.varimaxCriterion
  quartiminCriterionClosed : R.quartiminCriterion
  rotationIdentifiabilityClosed : R.rotationIdentifiability

def RotationClosed {L : FactorLoadingPackage}
    {V : VarianceExtractionPackage L} (R : RotationPackage V) : Prop :=
  R.orthogonalRotation ∧ R.obliqueRotation ∧ R.varimaxCriterion ∧
  R.quartiminCriterion ∧ R.rotationIdentifiability

theorem rotation_closed_from_evidence {L : FactorLoadingPackage}
    {V : VarianceExtractionPackage L} (R : RotationPackage V)
    (E : RotationEvidence R) : RotationClosed R := by
  exact And.intro E.orthogonalRotationClosed
    (And.intro E.obliqueRotationClosed
      (And.intro E.varimaxCriterionClosed
        (And.intro E.quartiminCriterionClosed E.rotationIdentifiabilityClosed)))

end FactorAnalysisPrincipalComponentsCorrespondenceCanonicalLaneLean
end HautevilleHouse
