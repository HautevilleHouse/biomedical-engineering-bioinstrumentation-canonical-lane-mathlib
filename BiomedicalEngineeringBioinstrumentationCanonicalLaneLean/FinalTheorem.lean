import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.BiomedicalEngineeringBioinstrumentationCanonicalLaneLean.BridgeLemmas
import HautevilleHouse.BiomedicalEngineeringBioinstrumentationCanonicalLaneLean.GateLemmas

namespace HautevilleHouse
namespace BiomedicalEngineeringBioinstrumentationCanonicalLaneLean

def ConstrainedBioinstrumentationClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_bioinstrumentation_endgame (A : AdmissibleClass) :
    ConstrainedBioinstrumentationClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end BiomedicalEngineeringBioinstrumentationCanonicalLaneLean
end HautevilleHouse
