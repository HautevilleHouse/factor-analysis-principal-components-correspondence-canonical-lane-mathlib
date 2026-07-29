import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FactorAnalysisPrincipalComponentsCorrespondenceCanonicalLaneLean

structure CovarianceStructure where
  variables : Nat
  observations : Nat
  covarianceMatrix : Type u
  eigenvalues : Type v
  eigenvectors : Type w
  matrixSymmetric : Prop
  matrixPositiveSemidefinite : Prop
  spectralDecompositionExists : Prop

def covarianceStructureClosed (C : CovarianceStructure) : Prop :=
  C.matrixSymmetric ∧ C.matrixPositiveSemidefinite ∧ C.spectralDecompositionExists

end FactorAnalysisPrincipalComponentsCorrespondenceCanonicalLaneLean
end HautevilleHouse