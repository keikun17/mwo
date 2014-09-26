require 'spec_helper'

describe MWO::Mech do
  describe '.all', vcr: {cassette_name: 'all_mechs'} do
    let (:subject) { described_class.all }
    let (:hbk4g) { an_object_having_attributes(name: 'hbk-4g', max_armor: 338, mech_id: 1, total_tons: 50, weight_class: 'Medium') }
    let (:com3a) { an_object_having_attributes(name: 'com-3a', max_armor: 178, mech_id: 6, total_tons: 25, weight_class: 'Light') }
    it "returns a collection of mechs collection" do
      expect(subject).to_not be_empty
      expect(subject).to include(an_instance_of(described_class))
      expect(subject).to include(hbk4g, com3a)
    end
  end

  describe '.dictionary', vcr: {cassette_name: 'mech_dictionary'} do
    let (:subject) { described_class.dictionary }
    it "returns json collection" do
      expect(subject).to_not be_empty
      expect(subject).to include({"1" => "hbk-4g"})
    end
  end
end
