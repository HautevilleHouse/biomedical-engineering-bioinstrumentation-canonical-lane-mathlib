import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BiomedicalEngineeringBioinstrumentationCanonicalLaneLean

structure DiagnosticInferencePackage where
  truePositives : Nat
  falsePositives : Nat
  falseNegatives : Nat
  trueNegatives : Nat
  sensitivity : Float
  specificity : Float
  positivePredictiveValue : Float
  negativePredictiveValue : Float
  aucROC : Float
  rocCurve : Prop

structure DiagnosticInferenceEvidence (D : DiagnosticInferencePackage) where
  truePositivesClosed : D.truePositives ≥ 0
  falsePositivesClosed : D.falsePositives ≥ 0
  falseNegativesClosed : D.falseNegatives ≥ 0
  trueNegativesClosed : D.trueNegatives ≥ 0
  sensitivityClosed : D.sensitivity ≥ 0 ∧ D.sensitivity ≤ 1
  specificityClosed : D.specificity ≥ 0 ∧ D.specificity ≤ 1
  positivePredictiveValueClosed : D.positivePredictiveValue ≥ 0 ∧ D.positivePredictiveValue ≤ 1
  negativePredictiveValueClosed : D.negativePredictiveValue ≥ 0 ∧ D.negativePredictiveValue ≤ 1
  aucROCClosed : D.aucROC ≥ 0 ∧ D.aucROC ≤ 1
  rocCurveClosed : D.rocCurve

def DiagnosticInferenceClosed (D : DiagnosticInferencePackage) : Prop :=
  D.truePositives ≥ 0 ∧ D.falsePositives ≥ 0 ∧ D.falseNegatives ≥ 0 ∧ D.trueNegatives ≥ 0 ∧
  (D.sensitivity ≥ 0 ∧ D.sensitivity ≤ 1) ∧ (D.specificity ≥ 0 ∧ D.specificity ≤ 1) ∧
  (D.positivePredictiveValue ≥ 0 ∧ D.positivePredictiveValue ≤ 1) ∧
  (D.negativePredictiveValue ≥ 0 ∧ D.negativePredictiveValue ≤ 1) ∧
  (D.aucROC ≥ 0 ∧ D.aucROC ≤ 1) ∧ D.rocCurve

theorem diagnostic_inference_closed_from_evidence (D : DiagnosticInferencePackage)
    (E : DiagnosticInferenceEvidence D) : DiagnosticInferenceClosed D := by
  refine And.intro E.truePositivesClosed (And.intro E.falsePositivesClosed (And.intro E.falseNegativesClosed
    (And.intro E.trueNegativesClosed (And.intro E.sensitivityClosed (And.intro E.specificityClosed
      (And.intro E.positivePredictiveValueClosed (And.intro E.negativePredictiveValueClosed
        (And.intro E.aucROCClosed E.rocCurveClosed))))))))

end BiomedicalEngineeringBioinstrumentationCanonicalLaneLean
end HautevilleHouse