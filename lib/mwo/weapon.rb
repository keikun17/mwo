class MWO::Weapon

  attr_accessor :weapon_id, :name, :type, :num_firing, :damage, :heatpenalty, :heat, :inner_sphere, :clan,
    :category, :health, :slots, :projectileclass, :heatdamage,
    :minheatpenaltylevel, :impulse, :cooldown, :ammo_type, :ammo_per_shot,
    :min_range, :long_range, :max_range, :tons, :duration, :lifetime,
    :speed, :volleydelay, :gravity, :max_depth, :vis_range, :heat_penalty_id,
    :maxheight, :radius, :artemis_ammo_type, :formation_size,
    :formation_size_per_index, :spread,:null_range, :peakdist, :peaktime,
    :minheight, :uselock, :trackingstrength, :hitpoints, :use_tag, :formation_speed, :emp, :coneoffire,
    :heatinctime, :trgheatinctime, :crit_dam_mult, :crit_chance_increase, :rof,
    :groupedlocally, :explode_chance, :internal_explosion_dmg, :num_per_shot,
    :tag, :tag_spread_factor, :tag_decay, :tag_duration, :needlock,
    :shots_during_cooldown, :jamming_chance, :jammed_time, :splash_percent,
    :volleysize, :falloffexponent

  extend MWO::Utils

  def initialize args = {}
    args.each do |k,v|
      instance_variable_set("@#{k}", v) unless v.nil?
    end
  end

  def self.all_raw(overrides: {})
    client = MWO::Client.new(overrides: {})
    raw = fetch(client.items_url)
  end

  def self.all(overrides: {})
    weapons = []

    all_raw.each do |weapon_id, attrs|
      if attrs["category"] == "weapon"

        weapon = {weapon_id: weapon_id.to_i,
                  name: attrs["name"],
                  category: attrs["category"]
        }

        if attrs["factions"]
          weapon[:clan] = attrs["factions"]["Clan"]
          weapon[:inner_sphere] = attrs["factions"]["InnerSphere"]
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

  def self.ballistic
    all.filter({type: 'Ballistic'})
  end

  def self.missile
    all.filter({type: 'Missile'})
  end

  def self.inner_sphere
    all.filter({inner_sphere: true})
  end

  def self.clan
    all.filter({clan: true})
  end
end
