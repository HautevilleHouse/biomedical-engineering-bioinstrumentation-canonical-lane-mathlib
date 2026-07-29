import BiomedicalEngineeringBioinstrumentationCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace BiomedicalEngineeringBioinstrumentationCanonicalLaneLean

structure PharmacokineticDosePackage where
  doseAmount : ℝ
  clearance : ℝ
  volumeOfDistribution : ℝ
  halfLife : ℝ

structure PharmacokineticDoseEvidence (D : PharmacokineticDosePackage) where
  doseAmountClosed : D.doseAmount ≥ 0
  clearanceClosed : D.clearance > 0
  volumeOfDistributionClosed : D.volumeOfDistribution > 0
  halfLifeClosed : D.halfLife > 0

def PharmacokineticDoseClosed (D : PharmacokineticDosePackage) : Prop :=
  D.doseAmount ≥ 0 ∧ D.clearance > 0 ∧ D.volumeOfDistribution > 0 ∧ D.halfLife > 0

theorem pharmacokinetic_dose_closed_from_evidence (D : PharmacokineticDosePackage)
    (E : PharmacokineticDoseEvidence D) : PharmacokineticDoseClosed D := by
  exact And.intro E.doseAmountClosed
    (And.intro E.clearanceClosed
      (And.intro E.volumeOfDistributionClosed E.halfLifeClosed))

end BiomedicalEngineeringBioinstrumentationCanonicalLaneLean
end HautevilleHouse