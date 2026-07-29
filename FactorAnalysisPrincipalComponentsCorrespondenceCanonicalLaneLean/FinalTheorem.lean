import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.FactorAnalysisPrincipalComponentsCorrespondenceCanonicalLaneLean.CorrespondenceMatrix
import HautevilleHouse.FactorAnalysisPrincipalComponentsCorrespondenceCanonicalLaneLean.PrincipalComponents

namespace HautevilleHouse
namespace FactorAnalysisPrincipalComponentsCorrespondenceCanonicalLaneLean

def ConstrainedFactorAnalysisClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_factor_analysis_endgame (A : AdmissibleClass) :
    ConstrainedFactorAnalysisClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end FactorAnalysisPrincipalComponentsCorrespondenceCanonicalLaneLean
end HautevilleHouse