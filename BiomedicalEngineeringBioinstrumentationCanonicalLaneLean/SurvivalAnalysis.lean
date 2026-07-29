import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BiomedicalEngineeringBioinstrumentationCanonicalLaneLean

structure SurvivalAnalysisPackage where
  subjectCount : Nat
  eventCount : Nat
  censoredCount : Nat
  kaplanMeierEstimator : Prop
  logRankTest : Prop
  hazardRatio : Float
  medianSurvivalTime : Float
  confidenceInterval : Float → Float

default confidenceInterval : Float → Float := λ x => x

structure SurvivalAnalysisEvidence (S : SurvivalAnalysisPackage) where
  subjectCountClosed : S.subjectCount > 0
  eventCountClosed : S.eventCount ≥ 0
  censoredCountClosed : S.censoredCount ≥ 0
  kaplanMeierEstimatorClosed : S.kaplanMeierEstimator
  logRankTestClosed : S.logRankTest
  hazardRatioClosed : S.hazardRatio ≥ 0
  medianSurvivalTimeClosed : S.medianSurvivalTime > 0

def SurvivalAnalysisClosed (S : SurvivalAnalysisPackage) : Prop :=
  S.subjectCount > 0 ∧ S.eventCount ≥ 0 ∧ S.censoredCount ≥ 0 ∧
  S.kaplanMeierEstimator ∧ S.logRankTest ∧ S.hazardRatio ≥ 0 ∧ S.medianSurvivalTime > 0

theorem survival_analysis_closed_from_evidence (S : SurvivalAnalysisPackage)
    (E : SurvivalAnalysisEvidence S) : SurvivalAnalysisClosed S := by
  exact And.intro E.subjectCountClosed
    (And.intro E.eventCountClosed
      (And.intro E.censoredCountClosed
        (And.intro E.kaplanMeierEstimatorClosed
          (And.intro E.logRankTestClosed
            (And.intro E.hazardRatioClosed E.medianSurvivalTimeClosed)))))

end BiomedicalEngineeringBioinstrumentationCanonicalLaneLean
end HautevilleHouse