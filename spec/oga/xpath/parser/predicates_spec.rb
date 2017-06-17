require 'spec_helper'

describe Oga::XPath::Parser do
  describe 'predicates' do
    it 'parses a single predicate' do
      expect(parse_xpath('foo[@class="bar"]')).to eq(s(
        :predicate,
        s(:axis, 'child', s(:test, nil, 'foo')),
        s(
          :eq,
          s(:axis, 'attribute', s(:test, nil, 'class')),
          s(:string, 'bar')
        )
      ))
    end

    it 'parses a predicate using the or operator' do
      expect(parse_xpath('foo[@x="bar" or @x="baz"]')).to eq(s(
        :predicate,
        s(:axis, 'child', s(:test, nil, 'foo')),
        s(
          :or,
          s(:eq, s(:axis, 'attribute', s(:test, nil, 'x')), s(:string, 'bar')),
          s(:eq, s(:axis, 'attribute', s(:test, nil, 'x')), s(:string, 'baz')),
        )
      ))
    end
  end
end
