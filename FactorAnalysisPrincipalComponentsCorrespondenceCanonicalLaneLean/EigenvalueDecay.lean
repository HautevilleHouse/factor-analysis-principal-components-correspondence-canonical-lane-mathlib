import canonicalLaneMathlib.AdmissibleClass
import FactorAnalysisPrincipalComponentsCorrespondenceCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace FactorAnalysisPrincipalComponentsCorrespondenceCanonicalLaneLean

structure EigenvalueDecayPackage where
  covarianceMatrix : Type u
  eigenvalues : Type v
  decayRate : Type w
  screePlotThreshold : Nat
  cumulativeVarianceRatio : Type u->Prop
  decayRateSpectralGap : Prop

structure EigenvalueDecayEvidence (E : EigenvalueDecayPackage) where
  screePlotThresholdClosed : E.screePlotThreshold ≥ 1
  cumulativeVarianceRatioSufficient : ∃ (k : Nat), E.cumulativeVarianceRatio k ≥ 0.95
  decayRateSpectralGapClosed : E.decayRateSpectralGap

def EigenvalueDecayClosed (E : EigenvalueDecayPackage) : Prop :=
  E.screePlotThreshold ≥ 1 ∧ (∃ (k : Nat), E.cumulativeVarianceRatio k ≥ 0.95) ∧ E.decayRateSpectralGap

theorem eigenvalue_decay_closed_from_evidence (E : EigenvalueDecayPackage) (Ev : EigenvalueDecayEvidence E) : EigenvalueDecayClosed E := by
  exact And.intro Ev.screePlotThresholdClosed (And.intro Ev.cumulativeVarianceRatioSufficient Ev.decayRateSpectralGapClosed)

end FactorAnalysisPrincipalComponentsCorrespondenceCanonicalLaneLean
end HautevilleHouse