import BiomedicalEngineeringBioinstrumentationCanonicalLaneLean.CompartmentModel

namespace HautevilleHouse
namespace BiomedicalEngineeringBioinstrumentationCanonicalLaneLean

structure PharmacokineticModel (C : CompartmentModel) where
  dose : Float
  bioavailability : Float
  volumeOfDistribution : Float
  clearance : Float
  halfLife : Float
  dosePositive : dose > 0
  bioavailabilityBetweenZeroAndOne : 0 ≤ bioavailability ∧ bioavailability ≤ 1
  volumeOfDistributionPositive : volumeOfDistribution > 0
  clearancePositive : clearance > 0
  halfLifePositive : halfLife > 0
  halfLifeFormula : halfLife = (0.693 * volumeOfDistribution) / clearance

def PharmacokineticModelClosed {C : CompartmentModel} (PK : PharmacokineticModel C) : Prop :=
  PK.dosePositive ∧ PK.bioavailabilityBetweenZeroAndOne ∧
  PK.volumeOfDistributionPositive ∧ PK.clearancePositive ∧
  PK.halfLifePositive ∧ PK.halfLifeFormula

theorem pharmacokinetic_model_closed_from_evidence {C : CompartmentModel}
    (PK : PharmacokineticModel C) : PharmacokineticModelClosed PK := by
  exact And.intro PK.dosePositive
    (And.intro PK.bioavailabilityBetweenZeroAndOne
      (And.intro PK.volumeOfDistributionPositive
        (And.intro PK.clearancePositive
          (And.intro PK.halfLifePositive PK.halfLifeFormula))))

end BiomedicalEngineeringBioinstrumentationCanonicalLaneLean
end HautevilleHouse