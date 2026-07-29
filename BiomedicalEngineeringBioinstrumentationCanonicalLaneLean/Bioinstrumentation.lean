import BiomedicalEngineeringBioinstrumentationCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace BiomedicalEngineeringBioinstrumentationCanonicalLaneLean

structure BioinstrumentationSignal where
  signalType : String
  samplingRate : Float
  bitDepth : Nat
  numberOfChannels : Nat
  signalLength : Nat
  samplingRatePositive : samplingRate > 0
  bitDepthPositive : bitDepth > 0
  numberOfChannelsPositive : numberOfChannels > 0
  signalLengthPositive : signalLength > 0

structure Sensor where
  sensorName : String
  measurementRange : Float × Float
  sensitivity : Float
  noiseFloor : Float
  sensitivityPositive : sensitivity > 0
  noiseFloorNonnegative : noiseFloor ≥ 0

def BioinstrumentationClosed (S : Sensor) (Sig : BioinstrumentationSignal) : Prop :=
  S.sensitivityPositive ∧ S.noiseFloorNonnegative ∧
  Sig.samplingRatePositive ∧ Sig.bitDepthPositive ∧
  Sig.numberOfChannelsPositive ∧ Sig.signalLengthPositive

theorem bioinstrumentation_closed_from_evidence (S : Sensor) (Sig : BioinstrumentationSignal)
    (h1 : S.sensitivityPositive) (h2 : S.noiseFloorNonnegative)
    (h3 : Sig.samplingRatePositive) (h4 : Sig.bitDepthPositive)
    (h5 : Sig.numberOfChannelsPositive) (h6 : Sig.signalLengthPositive) :
    BioinstrumentationClosed S Sig := by
  exact And.intro h1 (And.intro h2 (And.intro h3 (And.intro h4 (And.intro h5 h6))))

end BiomedicalEngineeringBioinstrumentationCanonicalLaneLean
end HautevilleHouse