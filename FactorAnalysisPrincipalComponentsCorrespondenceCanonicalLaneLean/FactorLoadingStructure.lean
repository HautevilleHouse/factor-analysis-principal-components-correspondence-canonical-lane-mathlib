import canonicalLaneMathlib.AdmissibleClass
import FactorAnalysisPrincipalComponentsCorrespondenceCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace FactorAnalysisPrincipalComponentsCorrespondenceCanonicalLaneLean

structure FactorLoadingStructurePackage where
  loadingMatrix : Type u
  factorCorrelation : Type v
  uniquenesses : Type w
  simpleStructureAchieved : Prop
  factorInterpretability : Prop
  crossLoadingBelowThreshold : Prop

structure FactorLoadingStructureEvidence (F : FactorLoadingStructurePackage) where
  simpleStructureAchievedClosed : F.simpleStructureAchieved
  factorInterpretabilityClosed : F.factorInterpretability
  crossLoadingBelowThresholdClosed : F.crossLoadingBelowThreshold

def FactorLoadingStructureClosed (F : FactorLoadingStructurePackage) : Prop :=
  F.simpleStructureAchieved ∧ F.factorInterpretability ∧ F.crossLoadingBelowThreshold

theorem factor_loading_structure_closed_from_evidence (F : FactorLoadingStructurePackage) (Ev : FactorLoadingStructureEvidence F) : FactorLoadingStructureClosed F := by
  exact And.intro Ev.simpleStructureAchievedClosed (And.intro Ev.factorInterpretabilityClosed Ev.crossLoadingBelowThresholdClosed)

end FactorAnalysisPrincipalComponentsCorrespondenceCanonicalLaneLean
end HautevilleHouse