import FactorAnalysisPrincipalComponentsCorrespondenceCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace FactorAnalysisPrincipalComponentsCorrespondenceCanonicalLaneLean

structure FactorLoadingPackage where
  nObs : Nat
  nVariables : Nat
  nFactors : Nat
  loadingsMatrix : Type u
  communalities : Type v
  uniquenesses : Type w
  loadingEstimatesDerived : Prop
  communalitiesDerived : Prop
  uniquenessesDerived : Prop

structure FactorLoadingEvidence (L : FactorLoadingPackage) where
  loadingEstimatesDerivedClosed : L.loadingEstimatesDerived
  communalitiesDerivedClosed : L.communalitiesDerived
  uniquenessesDerivedClosed : L.uniquenessesDerived

def FactorLoadingClosed (L : FactorLoadingPackage) : Prop :=
  L.loadingEstimatesDerived ∧ L.communalitiesDerived ∧ L.uniquenessesDerived

theorem factor_loading_closed_from_evidence (L : FactorLoadingPackage)
    (E : FactorLoadingEvidence L) : FactorLoadingClosed L := by
  exact And.intro E.loadingEstimatesDerivedClosed
    (And.intro E.communalitiesDerivedClosed E.uniquenessesDerivedClosed)

end FactorAnalysisPrincipalComponentsCorrespondenceCanonicalLaneLean
end HautevilleHouse
