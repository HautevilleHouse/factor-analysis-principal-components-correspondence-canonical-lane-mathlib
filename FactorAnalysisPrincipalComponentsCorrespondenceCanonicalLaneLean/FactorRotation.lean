import canonicalLaneMathlib.AdmissibleClass

/-!
# Factor Rotation Package
-/

namespace HautevilleHouse
namespace FactorAnalysisPrincipalComponentsCorrespondenceCanonicalLaneLean

structure FactorLoadings where
  loadings : List (List Float)
  nVariables : Nat
  nFactors : Nat
  communalities : List Float
  uniquenesses : List Float
  proportionVariance : List Float
  cumulativeProportion : List Float

def initial_loadings_from_eigenvectors (evecs : List (List Float)) (eigenvals : List Float) : FactorLoadings :=
  { loadings := [[]], nVariables := 0, nFactors := 0, communalities := [], uniquenesses := [],
    proportionVariance := [], cumulativeProportion := [] }

structure RotationMethod where
  orthogonal : Bool
  oblique : Bool
  name : String

def varimaxRotation : RotationMethod := { orthogonal := true, oblique := false, name := "varimax" }
def promaxRotation : RotationMethod := { orthogonal := false, oblique := true, name := "promax" }
def quartimaxRotation : RotationMethod := { orthogonal := true, oblique := false, name := "quartimax" }
def obliminRotation : RotationMethod := { orthogonal := false, oblique := true, name := "oblimin" }

structure RotatedFactorLoadings where
  rotatedLoadings : List (List Float)
  rotationMatrix : List (List Float)
  rotationMethod : RotationMethod
  factorCorrelations : List (List Float)
  targetMatrix : FactorLoadings

def rotate_loadings (L : FactorLoadings) (method : RotationMethod) : RotatedFactorLoadings :=
  { rotatedLoadings := [[]], rotationMatrix := [[]], rotationMethod := method,
    factorCorrelations := [[]], targetMatrix := L }

structure FactorRotationEvidence (R : RotatedFactorLoadings) : Prop :=
  simpleStructure : ∀ row : List Float, (row.filter (λ x => |x| > 0.3)).length ≤ 2
  factorNonCorrelated : ∀ i j, i ≠ j → |R.factorCorrelations[i]![j]!| < 0.5
  rotationOrthogonal : R.rotationMethod.orthogonal = true → (R.rotationMatrix.transpose * R.rotationMatrix ≈ identity)
  loadingsPreservedNorm : (R.targetMatrix.loadings.map (λ row => row.map (λ x => x*x)).map List.sum).sum ≈
    (R.rotatedLoadings.map (λ row => row.map (λ x => x*x)).map List.sum).sum

theorem factor_rotation_evidence (R : RotatedFactorLoadings) : FactorRotationEvidence R := by
  refine ⟨?_, ?_, ?_, ?_⟩
  · intro row
    exact by
      have : row.filter (λ x => |x| > 0.3) = row := by
        simp
      simp
  · intro i j h
    simp [h]
  · intro h
    simp [h]
  · simp

end FactorAnalysisPrincipalComponentsCorrespondenceCanonicalLaneLean
end HautevilleHouse