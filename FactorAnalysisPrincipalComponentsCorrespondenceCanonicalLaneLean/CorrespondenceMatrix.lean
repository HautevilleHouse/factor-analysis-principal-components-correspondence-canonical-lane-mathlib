import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FactorAnalysisPrincipalComponentsCorrespondenceCanonicalLaneLean

structure CorrespondenceMatrixPackage where
  rowCategories : Nat
  columnCategories : Nat
  matrixData : Type u
  rowSums : Type v
  columnSums : Type w
  grandTotal : Prop
  matrixNonnegative : Prop
  rowSumsPositive : Prop
  columnSumsPositive : Prop

structure CorrespondenceMatrixEvidence (C : CorrespondenceMatrixPackage) where
  grandTotalClosed : C.grandTotal
  matrixNonnegativeClosed : C.matrixNonnegative
  rowSumsPositiveClosed : C.rowSumsPositive
  columnSumsPositiveClosed : C.columnSumsPositive

def CorrespondenceMatrixClosed (C : CorrespondenceMatrixPackage) : Prop :=
  C.grandTotal ∧ C.matrixNonnegative ∧ C.rowSumsPositive ∧ C.columnSumsPositive

theorem correspondence_matrix_closed_from_evidence (C : CorrespondenceMatrixPackage)
    (E : CorrespondenceMatrixEvidence C) : CorrespondenceMatrixClosed C := by
  exact And.intro E.grandTotalClosed
    (And.intro E.matrixNonnegativeClosed
      (And.intro E.rowSumsPositiveClosed E.columnSumsPositiveClosed))

end FactorAnalysisPrincipalComponentsCorrespondenceCanonicalLaneLean
end HautevilleHouse