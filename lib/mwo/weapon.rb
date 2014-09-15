class MWO::Weapon
  extend MWO::Utils

  def self.all(overrides: {})
    client = MWO::Client.new(overrides: {})
    fetch(client.items_url)
  end
end
