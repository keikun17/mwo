require 'spec_helper'

class Something
  attr_accessor :name, :material, :color
  def initialize args = {}
    args.each do |k,v|
      instance_variable_set("@#{k}", v) unless v.nil?
    end
  end
end

describe MWO::CollectionUtils do
  let(:a) { Something.new(name: 'a', material: 'wood', color: 'red')}
  let(:b) { Something.new(name: 'b', material: 'plastic', color: 'green')}
  let(:c) { Something.new(name: 'c', material: 'plastic', color: 'blue')}
  let(:collection) {[a,b,c]}
  let(:unextended_collection) {[1,2,3]}

  describe '#filter' do
    it "filters extended collections " do
      collection.extend MWO::CollectionUtils
      expect(collection.filter({name:'a'})).to match([a])
      expect(collection.filter({material:'plastic'})).to match([b,c])
    end

    it "does not filter unextended collections" do
      expect{unextended_collection.filter}.to raise_error(NameError)
    end
  end
end

