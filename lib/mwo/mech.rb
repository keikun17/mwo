class MWO::Mech
  extend MWO::Utils

  def initialize args = {}
    args.each do |k,v|
      instance_variable_set("@#{k}", v) unless v.nil?
    end
  end

  def self.all
    client = MWO::Client.new(overrides: {})
    raw = fetch(client.mechs_url)

    mechs = []
    raw["Mechs"].each do |name, attrs|
      mech = new(attrs)
      mechs << mech
    end
    mechs
  end

  def self.dictionary
    client = MWO::Client.new(overrides: {})
    raw = fetch(client.mech_ids_url)
  end
end
