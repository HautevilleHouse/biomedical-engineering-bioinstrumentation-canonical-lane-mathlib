import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BiomedicalEngineeringBioinstrumentationCanonicalLaneLean

structure CompartmentModelPackage where
  compartments : Nat
  volumeOfDistribution : Float
  clearance : Float
  absorptionRate : Float
  eliminationRate : Float
  initialConcentration : Float
  timeCourse : Prop
  doseResponse : Prop

structure CompartmentModelEvidence (P : CompartmentModelPackage) where
  compartmentsClosed : P.compartments > 0
  volumeOfDistributionClosed : P.volumeOfDistribution > 0
  clearanceClosed : P.clearance > 0
  absorptionRateClosed : P.absorptionRate ≥ 0
  eliminationRateClosed : P.eliminationRate > 0
  initialConcentrationClosed : P.initialConcentration ≥ 0
  timeCourseClosed : P.timeCourse
  doseResponseClosed : P.doseResponse

def CompartmentModelClosed (P : CompartmentModelPackage) : Prop :=
  P.compartments > 0 ∧ P.volumeOfDistribution > 0 ∧ P.clearance > 0 ∧
  P.absorptionRate ≥ 0 ∧ P.eliminationRate > 0 ∧ P.initialConcentration ≥ 0 ∧
  P.timeCourse ∧ P.doseResponse

theorem compartment_model_closed_from_evidence (P : CompartmentModelPackage)
    (E : CompartmentModelEvidence P) : CompartmentModelClosed P := by
  exact And.intro E.compartmentsClosed
    (And.intro E.volumeOfDistributionClosed
      (And.intro E.clearanceClosed
        (And.intro E.absorptionRateClosed
          (And.intro E.eliminationRateClosed
            (And.intro E.initialConcentrationClosed
              (And.intro E.timeCourseClosed E.doseResponseClosed))))))

end BiomedicalEngineeringBioinstrumentationCanonicalLaneLean
end HautevilleHouse