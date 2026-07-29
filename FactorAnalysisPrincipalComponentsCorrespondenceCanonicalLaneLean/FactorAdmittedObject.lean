import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FactorAnalysisPrincipalComponentsCorrespondenceCanonicalLaneLean

structure FactorSpace where
  carrier : Type
  topology : TopologicalSpace carrier

structure FactorAdmittedObject where
  space : FactorSpace
  dimensionalityReduced : Prop
  factorsIdentified : Prop
  principalComponentsExtracted : Prop
  conclusion : factorsIdentified ∧ principalComponentsExtracted

def FactorWitnessClosed (O : FactorAdmittedObject) : Prop :=
  O.factorsIdentified ∧ O.principalComponentsExtracted

end FactorAnalysisPrincipalComponentsCorrespondenceCanonicalLaneLean
end HautevilleHouse