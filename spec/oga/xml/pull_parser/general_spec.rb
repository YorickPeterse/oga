require 'spec_helper'

describe Oga::XML::PullParser do
  describe 'tracking nodes' do
    before :all do
      @parser = described_class.new('<a></a>')
    end

    it 'tracks the current node' do
      @parser.parse do
        expect(@parser.node.is_a?(Oga::XML::Element)).to eq(true)
      end
    end
  end
end
