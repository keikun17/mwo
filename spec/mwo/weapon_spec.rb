require 'spec_helper'

describe MWO::Weapon do

  describe ".all" do
    subject(:weapons) {described_class.all}
    it "returns a collection of weapons", vcr: {cassette_name: 'all_weapons'} do
      expect(weapons).to include(
        an_object_having_attributes(weapon_id: 1000, name: "AutoCannon20", type: 'Ballistic', num_firing: 1,  damage: 20, heatpenalty: 24, heat: 6, factions: include(clan: false, inner_sphere: true)),
        an_object_having_attributes(weapon_id: 1241, name: "ClanAutoCannon20", type: 'Ballistic', num_firing: 5, damage: 4, heatpenalty: 30, heat: 6, factions: include(clan: true, inner_sphere: false))
      )
    end
  end
end
