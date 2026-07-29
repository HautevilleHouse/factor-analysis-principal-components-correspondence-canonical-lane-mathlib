import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FactorAnalysisPrincipalComponentsCorrespondenceCanonicalLaneLean

structure CovarianceStructure where
  matrixType : Type
  rank : Nat
  eigendecomposition : Prop
  positiveSemidefinite : Prop
  factorLoading : Prop

def CovarianceClosed (C : CovarianceStructure) : Prop :=
  C.eigendecomposition ∧ C.positiveSemidefinite ∧ C.factorLoading

structure FactorModel where
  observedVariables : Nat
  latentFactors : Nat
  loadings : Type
  uniqueness : Type
  modelIdentified : Prop

def FactorModelAdmissible (M : FactorModel) : Prop :=
  M.modelIdentified

end FactorAnalysisPrincipalComponentsCorrespondenceCanonicalLaneLean
end HautevilleHouse
