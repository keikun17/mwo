class MWO::Mech < OpenStruct
  extend MWO::Utils

  def self.all_raw(overrides: {})
    client = MWO::Client.new(overrides: {})
    fetch(client.mechs_url)
  end

  def self.all

    mechs = []
    all_raw["Mechs"].each do |name, attrs|

      # Remove the loadout from the index.
      attrs.delete('Loadout')

      # The mech classification value is broken in the API
      attrs.delete('Class')
      attrs["WeightClass"] = case attrs['MaxTons']
      when 0..35
        'Light'
      when 36..55
        'Medium'
      when 56..75
        'Heavy'
      when 76..100
        'Assault'
      when 101.300
        'Experimental'
      end

      # Remove the 'class' attribute, it is bugged from the API
      attrs.delete('Loadout')

      mech = {}
      attrs.each do |k,v|
        mech[to_symbol(k)] = v
      end

      # set override the invalid classification
      mechs << new(mech)
    end

    return mechs.extend MWO::CollectionUtils
  end

  def self.lights
    all.filter({weight_class: 'Light'})
  end

  def self.mediums
    all.filter({weight_class: 'Medium'})
  end

  def self.heavies
    all.filter({weight_class: 'Heavy'})
  end

  def self.assaults
    all.filter({weight_class: 'Assault'})
  end

  def self.dictionary
    client = MWO::Client.new(overrides: {})
    raw = fetch(client.mech_ids_url)
    raw["Mechs"]
  end
end
