import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.FactorAnalysisPrincipalComponentsCorrespondenceCanonicalLaneLean.CorrespondenceMatrix

namespace HautevilleHouse
namespace FactorAnalysisPrincipalComponentsCorrespondenceCanonicalLaneLean

structure PrincipalComponentsPackage {C : CorrespondenceMatrixPackage} where
  standardizedResiduals : Type u
  singularValueDecomposition : Prop
  rowPrincipalComponents : Type v
  columnPrincipalComponents : Type w
  inertiaProportions : Prop
  totalInertia : Prop

structure PrincipalComponentsEvidence {C : CorrespondenceMatrixPackage}
    (P : PrincipalComponentsPackage C) where
  singularValueDecompositionClosed : P.singularValueDecomposition
  inertiaProportionsClosed : P.inertiaProportions
  totalInertiaClosed : P.totalInertia

def PrincipalComponentsClosed {C : CorrespondenceMatrixPackage}
    (P : PrincipalComponentsPackage C) : Prop :=
  P.singularValueDecomposition ∧ P.inertiaProportions ∧ P.totalInertia

theorem principal_components_closed_from_evidence {C : CorrespondenceMatrixPackage}
    (P : PrincipalComponentsPackage C) (E : PrincipalComponentsEvidence P)
    : PrincipalComponentsClosed P := by
  exact And.intro E.singularValueDecompositionClosed
    (And.intro E.inertiaProportionsClosed E.totalInertiaClosed)

end FactorAnalysisPrincipalComponentsCorrespondenceCanonicalLaneLean
end HautevilleHouse