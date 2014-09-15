require 'spec_helper'

describe MWO::Weapon do

  describe ".all" do
    subject(:weapons) {described_class.all}
    it "returns a collection of weapons", vcr: {cassette_name: 'all_weapons'} do
      expect(weapons).to include(
        an_object_having_attributes(weapon_id: 1000, name: "AutoCannon20", type: 'Ballistic', num_firing: 1,  damage: 20, heatpenalty: 24, heat: 6, faction: 'InnerSphere'),
        an_object_having_attributes(weapon_id: 1201, name: "ClanAutoCannon20", type: 'Ballistic', num_firing: 5, damage: 4, heatpenalty: 30, heat: 6, faction: 'Clan'),
        an_object_having_attributes(weapon_id: 1201, name: "ClanAutoCannon20", type: 'Ballistic', num_firing: 5, damage: 4, heatpenalty: 24, faction: 'InnerSphere')
      )
    end
  end
end
