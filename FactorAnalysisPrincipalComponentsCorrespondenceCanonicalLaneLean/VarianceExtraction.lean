import FactorAnalysisPrincipalComponentsCorrespondenceCanonicalLaneLean.CorrelationStructure

namespace HautevilleHouse
namespace FactorAnalysisPrincipalComponentsCorrespondenceCanonicalLaneLean

structure VarianceExtractionPackage {L : FactorLoadingPackage} where
  totalVariance : Prop
  explainedVariance : Prop
  proportionVariance : Prop
  cumulativeProportion : Prop
  eigenvalueDecomposition : Prop

structure VarianceExtractionEvidence {L : FactorLoadingPackage}
    (V : VarianceExtractionPackage L) where
  totalVarianceClosed : V.totalVariance
  explainedVarianceClosed : V.explainedVariance
  proportionVarianceClosed : V.proportionVariance
  cumulativeProportionClosed : V.cumulativeProportion
  eigenvalueDecompositionClosed : V.eigenvalueDecomposition

def VarianceExtractionClosed {L : FactorLoadingPackage}
    (V : VarianceExtractionPackage L) : Prop :=
  V.totalVariance ∧ V.explainedVariance ∧ V.proportionVariance ∧
  V.cumulativeProportion ∧ V.eigenvalueDecomposition

theorem variance_extraction_closed_from_evidence {L : FactorLoadingPackage}
    (V : VarianceExtractionPackage L) (E : VarianceExtractionEvidence V) :
    VarianceExtractionClosed V := by
  exact And.intro E.totalVarianceClosed
    (And.intro E.explainedVarianceClosed
      (And.intro E.proportionVarianceClosed
        (And.intro E.cumulativeProportionClosed E.eigenvalueDecompositionClosed)))

end FactorAnalysisPrincipalComponentsCorrespondenceCanonicalLaneLean
end HautevilleHouse
