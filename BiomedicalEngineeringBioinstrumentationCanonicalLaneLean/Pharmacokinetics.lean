import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.BiomedicalEngineeringBioinstrumentationCanonicalLaneLean.CompartmentModel

namespace HautevilleHouse
namespace BiomedicalEngineeringBioinstrumentationCanonicalLaneLean

structure PharmacokineticsPackage {C : CompartmentModelPackage} where
  absorptionRate : Prop
  eliminationRate : Prop
  bioavailability : Prop
  halfLife : Prop
  areaUnderCurve : Prop
  clearance : Prop
  pkParametersConsistent : Prop

structure PharmacokineticsEvidence {C : CompartmentModelPackage} (P : PharmacokineticsPackage C) where
  absorptionRateClosed : P.absorptionRate
  eliminationRateClosed : P.eliminationRate
  bioavailabilityClosed : P.bioavailability
  halfLifeClosed : P.halfLife
  areaUnderCurveClosed : P.areaUnderCurve
  clearanceClosed : P.clearance
  pkParametersConsistentClosed : P.pkParametersConsistent

def PharmacokineticsClosed {C : CompartmentModelPackage} (P : PharmacokineticsPackage C) : Prop :=
  P.absorptionRate ∧ P.eliminationRate ∧ P.bioavailability ∧
  P.halfLife ∧ P.areaUnderCurve ∧ P.clearance ∧ P.pkParametersConsistent

theorem pharmacokinetics_closed_from_evidence {C : CompartmentModelPackage}
  (P : PharmacokineticsPackage C) (E : PharmacokineticsEvidence P) : PharmacokineticsClosed P := by
  exact And.intro E.absorptionRateClosed
    (And.intro E.eliminationRateClosed
      (And.intro E.bioavailabilityClosed
        (And.intro E.halfLifeClosed
          (And.intro E.areaUnderCurveClosed
            (And.intro E.clearanceClosed E.pkParametersConsistentClosed)))))

end BiomedicalEngineeringBioinstrumentationCanonicalLaneLean
end HautevilleHouse
