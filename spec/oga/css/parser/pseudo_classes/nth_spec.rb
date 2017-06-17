require 'spec_helper'

describe Oga::CSS::Parser do
  describe ':nth pseudo class' do
    it 'parses the :nth(1) pseudo class' do
      expect(parse_css(':nth(1)'))
        .to eq(parse_xpath('descendant::*[position() = 1]'))
    end

    it 'parses the :nth(2) pseudo class' do
      expect(parse_css(':nth(2)'))
        .to eq(parse_xpath('descendant::*[position() = 2]'))
    end
  end
end
