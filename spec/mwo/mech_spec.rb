require 'spec_helper'

describe MWO::Mech do
  describe '.all', vcr: {cassette_name: 'all_mechs'} do
    let (:subject) { described_class.all }
    it "returns a collection of mechs collection" do
      expect(subject).to_not be_empty
      expect(subject).to include(an_instance_of(described_class))
    end
  end

  describe '.dictionary', vcr: {cassette_name: 'mech_dictionary'} do
    let (:subject) { described_class.dictionary }
    it "returns json collection" do
      expect(subject).to_not be_empty
    end
  end
end
