import canonicalLaneMathlib.DataCovarianceAdmissible

namespace HautevilleHouse
namespace FactorAnalysisPrincipalComponentsCorrespondenceCanonicalLaneLean

structure PCAAxis where
  eigenvalue : ℝ
  eigenvector : Vector ℝ
  varianceProportion : ℝ
  componentScore : Type

def PCAVarianceClosed (A : PCAAxis) : Prop :=
  A.varianceProportion ≥ 0

structure CorrespondenceMatrix where
  rowProfile : Type
  columnProfile : Type
  inertia : Prop
  chiSquareDistance : Prop

def CorrespondenceAdmissible (C : CorrespondenceMatrix) : Prop :=
  C.inertia ∧ C.chiSquareDistance

end FactorAnalysisPrincipalComponentsCorrespondenceCanonicalLaneLean
end HautevilleHouse
