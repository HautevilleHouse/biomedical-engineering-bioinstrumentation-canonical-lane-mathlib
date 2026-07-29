import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BiomedicalEngineeringBioinstrumentationCanonicalLaneLean

structure BioinstrumentationAdmittedObject where
  compartmentModel : Type u
  pharmacokineticParameters : Type v
  diagnosticTest : Type w
  survivalFunction : Type x
  modelConsistency : Prop
  endpointSatisfied : Prop
  remainderRecorded : Prop
  conclusion : endpointSatisfied ∨ remainderRecorded

structure AdmissibleClass where
  object : BioinstrumentationAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  BioinstrumentationWitnessClosed A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

def BioinstrumentationWitnessClosed (O : BioinstrumentationAdmittedObject) : Prop :=
  O.modelConsistency

end BiomedicalEngineeringBioinstrumentationCanonicalLaneLean
end HautevilleHouse
