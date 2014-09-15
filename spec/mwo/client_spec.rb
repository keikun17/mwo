require 'spec_helper'

describe MWO::Client do

  let(:host) { 'http://static.mwomercs.com' }
  subject(:client) { described_class.new(host: host) }

  describe "#items_url" do
    it "returns the url for items api"  do
      expect(client.items_url).to eq("http://static.mwomercs.com/api/items/list/full.json")
    end
  end

  describe "#omniparts_url" do
    it "returns the url for items api"  do
      expect(client.omniparts_url).to eq("http://static.mwomercs.com/api/omniparts/list/full.json")
    end
  end

  describe "#mech_ids" do
    it "returns the url for items api"  do
      expect(client.mech_ids_url).to eq("http://static.mwomercs.com/api/mechs/list/dict.json")
    end
  end

  it "raises and error when the api cannot be accessed"

end
