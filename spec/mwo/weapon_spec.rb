require 'spec_helper'

describe MWO::Weapon do

  describe ".all" do
    subject(:weapons) {described_class.all}
    it "returns a collection of weapons", vcr: {cassette_name: 'all_weapons'} do
      expect(weapons).to include(
        an_object_having_attributes(weapon_id: 1000, name: "AutoCannon20", type: 'Ballistic', num_firing: 1,  damage: 20, heatpenalty: 24, heat: 6, clan: false, inner_sphere: true),
        an_object_having_attributes(weapon_id: 1241, name: "ClanAutoCannon20", type: 'Ballistic', num_firing: 5, damage: 4, heatpenalty: 30, heat: 6, clan: true, inner_sphere: false)
      )
    end
  end

  describe ".energy", vcr: {cassette_name: 'all_weapons'} do
    subject(:energy_weapons) {described_class.energy }
    it "returns a collection of energy weapons" do
      expect(energy_weapons).to_not be_empty
      expect(energy_weapons.collect(&:type)).to include('Energy')
      expect(energy_weapons.collect(&:type)).to_not include('Ballistic', 'Missile')
    end
  end

  describe ".ballistic", vcr: {cassette_name: 'all_weapons'} do
    subject(:ballistic_weapons) {described_class.ballistic }
    it "returns a collection of energy weapons" do
      expect(ballistic_weapons).to_not be_empty
      expect(ballistic_weapons.collect(&:type)).to include('Ballistic')
      expect(ballistic_weapons.collect(&:type)).to_not include('Energy', 'Missile')
    end
  end

  describe ".missile", vcr: {cassette_name: 'all_weapons'} do
    subject(:missile_weapons) {described_class.missile }
    it "returns a collection of energy weapons" do
      expect(missile_weapons).to_not be_empty
      expect(missile_weapons).to include( an_object_having_attributes(type: 'Missile'))
      expect(missile_weapons).to_not include( an_object_having_attributes(type: 'Ballistic'))
      expect(missile_weapons).to_not include( an_object_having_attributes(type: 'Energy'))
    end
  end

  describe ".inner_sphere", vcr: {cassette_name: 'all_weapons'} do
    subject(:inner_sphere_weapons) {described_class.inner_sphere }
    it "returns a collection of energy weapons" do
      expect(inner_sphere_weapons).to_not be_empty
      expect(inner_sphere_weapons).to include(an_object_having_attributes(inner_sphere: true))
      expect(inner_sphere_weapons).to_not include(an_object_having_attributes(inner_sphere: false))
    end
  end
end
