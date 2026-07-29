import FactorAnalysisPrincipalComponentsCorrespondenceCanonicalLaneLean.PrincipalComponents

namespace HautevilleHouse
namespace FactorAnalysisPrincipalComponentsCorrespondenceCanonicalLaneLean

structure CorrespondencePackage {L : FactorLoadingPackage}
    {V : VarianceExtractionPackage L} {R : RotationPackage V}
    {P : PrincipalComponentsPackage R} where
  contingencyTable : Type u
  rowProfiles : Type v
  columnProfiles : Type w
  inertia : Prop
  chiSquareDistance : Prop
  rowScores : Type x
  columnScores : Type y

structure CorrespondenceEvidence {L : FactorLoadingPackage}
    {V : VarianceExtractionPackage L} {R : RotationPackage V}
    {P : PrincipalComponentsPackage R} (C : CorrespondencePackage P) where
  inertiaClosed : C.inertia
  chiSquareDistanceClosed : C.chiSquareDistance
  rowScoresClosed : Nonempty C.rowScores
  columnScoresClosed : Nonempty C.columnScores

def CorrespondenceClosed {L : FactorLoadingPackage}
    {V : VarianceExtractionPackage L} {R : RotationPackage V}
    {P : PrincipalComponentsPackage R} (C : CorrespondencePackage P) : Prop :=
  C.inertia ∧ C.chiSquareDistance ∧ Nonempty C.rowScores ∧ Nonempty C.columnScores

theorem correspondence_closed_from_evidence {L : FactorLoadingPackage}
    {V : VarianceExtractionPackage L} {R : RotationPackage V}
    {P : PrincipalComponentsPackage R} (C : CorrespondencePackage P)
    (E : CorrespondenceEvidence C) : CorrespondenceClosed C := by
  exact And.intro E.inertiaClosed
    (And.intro E.chiSquareDistanceClosed
      (And.intro E.rowScoresClosed E.columnScoresClosed))

end FactorAnalysisPrincipalComponentsCorrespondenceCanonicalLaneLean
end HautevilleHouse
