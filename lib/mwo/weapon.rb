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
    fetch(client.items_url)
  end
end
