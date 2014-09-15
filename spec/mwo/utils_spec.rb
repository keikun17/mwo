require 'spec_helper'

class UtilUserClass
end

describe UtilUserClass do

  before do
    described_class.extend(MWO::Utils)
  end

  describe ".fetch", vcr: {cassette_name: 'utils_fetch_url'} do
    let(:url) { "http://static.mwomercs.com/api/items/list/full.json"}
    subject {described_class.fetch(url)}

    it "returns a non empty hash" do
      expect(subject).to_not be_empty
    end

  end
end
