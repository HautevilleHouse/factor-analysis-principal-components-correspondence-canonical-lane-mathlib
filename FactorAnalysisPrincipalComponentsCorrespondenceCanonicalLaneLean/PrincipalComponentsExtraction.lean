import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.FactorAnalysisPrincipalComponentsCorrespondenceCanonicalLaneLean.CovarianceStructure

namespace HautevilleHouse
namespace FactorAnalysisPrincipalComponentsCorrespondenceCanonicalLaneLean

structure PrincipalComponentsExtraction (C : CovarianceStructure) where
  components : Nat
  loadingsMatrix : Type u
  varianceExplained : Type v
  componentsComputed : Prop
  loadingsOrthogonal : Prop
  varianceMaximized : Prop

def principalComponentsExtractionClosed (C : CovarianceStructure) (P : PrincipalComponentsExtraction C) : Prop :=
  P.componentsComputed ∧ P.loadingsOrthogonal ∧ P.varianceMaximized

end FactorAnalysisPrincipalComponentsCorrespondenceCanonicalLaneLean
end HautevilleHouse