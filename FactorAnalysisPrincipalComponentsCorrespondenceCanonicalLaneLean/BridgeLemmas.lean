import canonicalLaneMathlib.AdmissibleClass
import FactorAnalysisPrincipalComponentsCorrespondenceCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace FactorAnalysisPrincipalComponentsCorrespondenceCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  FactorWitnessClosed A.object

theorem bridge_from_admissible_class (A : AdmissibleClass) : bridgeClosed A := by
  exact A.object.conclusion

end FactorAnalysisPrincipalComponentsCorrespondenceCanonicalLaneLean
end HautevilleHouse