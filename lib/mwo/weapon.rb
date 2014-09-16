class MWO::Weapon
  attr_accessor :weapon_id, :name, :type, :num_firing, :damage, :heatpenalty, :heat, :factions

  extend MWO::Utils

  def initialize args = {}
    args.each do |k,v|
      instance_variable_set("@#{k}", v) unless v.nil?
    end
  end

  def self.all(overrides: {})
    client = MWO::Client.new(overrides: {})
    raw = fetch(client.items_url)

    weapons = []

    raw.each do |weapon_id, attrs|
      if attrs["category"] == "weapon"


        weapon = {weapon_id: weapon_id.to_i,
                  name: attrs["name"],
                  category: attrs["category"],
                  stats: {}}

        if attrs["factions"]
          weapon[:factions] = {}
          attrs["factions"].each do |k,v|
            weapon[:factions][to_symbol(k)] = v
          end
        end

        attrs["stats"].each do |k,v|
          weapon[to_symbol(k)] = v
        end

        weapons << new(weapon)
      end

    end

    return weapons.extend MWO::CollectionUtils

  end

  def self.energy
    all.filter({type: 'Energy'})
  end
end
