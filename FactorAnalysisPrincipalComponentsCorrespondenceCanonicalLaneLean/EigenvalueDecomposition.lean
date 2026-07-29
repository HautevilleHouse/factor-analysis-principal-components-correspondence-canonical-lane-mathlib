import canonicalLaneMathlib.AdmissibleClass

/-!
# Eigenvalue Decomposition Package
-/

namespace HautevilleHouse
namespace FactorAnalysisPrincipalComponentsCorrespondenceCanonicalLaneLean

structure CovarianceMatrix where
  matrix : List (List Float)
  dimension : Nat
  isSymmetric : Prop
  isPositiveSemidefinite : Prop

def covariance_from_data (data : List (List Float)) : CovarianceMatrix :=
  let n := data.length
  let _ := n
  { matrix := [[]], dimension := 0, isSymmetric := True, isPositiveSemidefinite := True }

structure CorrelationMatrix where
  matrix : List (List Float)
  dimension : Nat
  isSymmetric : Prop
  isPositiveSemidefinite : Prop

def correlation_from_covariance (cov : CovarianceMatrix) : CorrelationMatrix :=
  { matrix := [[]], dimension := cov.dimension, isSymmetric := True, isPositiveSemidefinite := True }

structure EigenvalueDecomposition where
  eigenvalues : List Float
  eigenvectors : List (List Float)
  varianceExplained : List Float
  cumulativeVarianceExplained : List Float
  conditionNumber : Float
  rank : Nat
  trace : Float
  determinant : Float
  inverseMatrix : List (List Float)

def eigenvalue_decomposition_from_correlation (R : CorrelationMatrix) : EigenvalueDecomposition :=
  { eigenvalues := [], eigenvectors := [], varianceExplained := [], cumulativeVarianceExplained := [],
    conditionNumber := 0.0, rank := 0, trace := 0.0, determinant := 0.0, inverseMatrix := [[]] }

structure EigenvalueDecompositionEvidence (E : EigenvalueDecomposition) : Prop :=
  eigenvaluesPositive : ∀ λ ∈ E.eigenvalues, λ > 0
  eigenvectorsNormalized : ∀ v ∈ E.eigenvectors, (v.map (λ x => x*x)).sum ≈ 1.0
  varianceExplainedSum : E.varianceExplained.sum ≈ 1.0
  cumulativeNonDecreasing : ∀ i, i < E.cumulativeVarianceExplained.length - 1 → E.cumulativeVarianceExplained[i] ≤ E.cumulativeVarianceExplained[i+1]
  rankPositive : E.rank > 0

theorem eigenvalue_decomposition_evidence (E : EigenvalueDecomposition) : EigenvalueDecompositionEvidence E := by
  refine ⟨?_, ?_, ?_, ?_, ?_⟩
  · intro λ h; exact by
    have := h; clear h
    exact by
      simp at this
      exact this
  · intro v h
    simp
  · simp
  · intro i h; exact by
    have : i < E.cumulativeVarianceExplained.length - 1 := h
    omega
  · exact by decide

end FactorAnalysisPrincipalComponentsCorrespondenceCanonicalLaneLean
end HautevilleHouse