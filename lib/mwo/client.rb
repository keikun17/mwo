class MWO::Client
  ITEMS_PATH     = "/api/items/list/full.json"
  OMNIPARTS_PATH = "/api/omniparts/list/full.json"
  MECH_IDS_PATH  = "/api/mechs/list/dict.json"

  attr_accessor :host

  def initialize(args = {})
    @host = args[:host] || "http://static.mwomercs.com"
  end

  def items
  end

  def items_url
    host + ITEMS_PATH
  end

  def omniparts_url
    host + OMNIPARTS_PATH
  end

  def mech_ids_url
    host + MECH_IDS_PATH
  end

end
