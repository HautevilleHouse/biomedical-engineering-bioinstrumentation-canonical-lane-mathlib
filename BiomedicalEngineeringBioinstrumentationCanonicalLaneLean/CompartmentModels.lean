import HautevilleHouse.BiomedicalEngineeringBioinstrumentationCanonicalLaneLean.AdmissibleClass

/-!
# Compartment Models Package
-/

namespace HautevilleHouse
namespace BiomedicalEngineeringBioinstrumentationCanonicalLaneLean

structure CompartmentModelPackage where
  numberOfCompartments : Nat
  rateConstants : Type
  initialConditions : Type
  modelEquations : Prop
  parameterEstimability : Prop

structure CompartmentModelEvidence (C : CompartmentModelPackage) where
  modelEquationsClosed : C.modelEquations
  parameterEstimabilityClosed : C.parameterEstimability

def CompartmentModelClosed (C : CompartmentModelPackage) : Prop :=
  C.modelEquations ∧ C.parameterEstimability

theorem compartment_model_closed_from_evidence (C : CompartmentModelPackage)
    (E : CompartmentModelEvidence C) : CompartmentModelClosed C := by
  exact And.intro E.modelEquationsClosed E.parameterEstimabilityClosed

end BiomedicalEngineeringBioinstrumentationCanonicalLaneLean
end HautevilleHouse