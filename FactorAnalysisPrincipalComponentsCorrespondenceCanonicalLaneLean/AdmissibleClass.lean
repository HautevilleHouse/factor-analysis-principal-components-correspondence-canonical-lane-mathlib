import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FactorAnalysisPrincipalComponentsCorrespondenceCanonicalLaneLean

structure AdmissibleClass where
  object : FactorAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  FactorWitnessClosed A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end FactorAnalysisPrincipalComponentsCorrespondenceCanonicalLaneLean
end HautevilleHouse