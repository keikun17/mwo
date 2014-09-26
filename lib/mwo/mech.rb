class MWO::Mech < OpenStruct
  extend MWO::Utils

  # def initialize args = {}
  #   args.each do |k,v|
  #     instance_variable_set("@#{k}", v) unless v.nil?
  #   end
  # end

  def self.all
    client = MWO::Client.new(overrides: {})
    raw = fetch(client.mechs_url)

    mechs = []
    raw["Mechs"].each do |name, attrs|

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

      mechs << new(mech)
    end
    mechs
  end

  def self.dictionary
    client = MWO::Client.new(overrides: {})
    raw = fetch(client.mech_ids_url)
    raw["Mechs"]
  end
end
