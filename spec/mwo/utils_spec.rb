require 'spec_helper'

class UtilUserClass
  extend MWO::Utils
end

describe UtilUserClass do

  describe ".fetch", vcr: {cassette_name: 'utils_fetch_url'} do
    let(:url) { "http://static.mwomercs.com/api/items/list/full.json"}
    subject {described_class.fetch(url)}

    it "returns a non empty hash" do
      expect(subject).to_not be_empty
    end

  end
end
