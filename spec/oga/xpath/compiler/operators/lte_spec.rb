require 'spec_helper'

describe Oga::XPath::Compiler do
  describe 'lower-than-or-equal operator' do
    before do
      @document = parse('<root><a>10</a><b>20</b></root>')
    end

    it 'returns true if a number is lower than another number' do
      expect(evaluate_xpath(@document, '10 <= 20')).to eq(true)
    end

    it 'returns true if a number is equal to another number' do
      expect(evaluate_xpath(@document, '10 <= 10')).to eq(true)
    end

    it 'returns false if a number is not lower than/equal to another number' do
      expect(evaluate_xpath(@document, '20 <= 10')).to eq(false)
    end

    it 'returns true if a number is lower than a string' do
      expect(evaluate_xpath(@document, '10 <= "20"')).to eq(true)
    end

    it 'returns true if a number is equal to a string' do
      expect(evaluate_xpath(@document, '10 <= "10"')).to eq(true)
    end

    it 'returns true if a string is lower than a number' do
      expect(evaluate_xpath(@document, '"10" <= 20')).to eq(true)
    end

    it 'returns true if a string is equal to a number' do
      expect(evaluate_xpath(@document, '"10" <= 10')).to eq(true)
    end

    it 'returns true if a string is lower than another string' do
      expect(evaluate_xpath(@document, '"10" <= "20"')).to eq(true)
    end

    it 'returns true if a number is lower than a node set' do
      expect(evaluate_xpath(@document, '10 <= root/b')).to eq(true)
    end

    it 'returns true if a number is equal to a node set' do
      expect(evaluate_xpath(@document, '10 <= root/a')).to eq(true)
    end

    it 'returns true if a string is lower than a node set' do
      expect(evaluate_xpath(@document, '"10" <= root/b')).to eq(true)
    end

    it 'returns true if a string is equal to a node set' do
      expect(evaluate_xpath(@document, '"10" <= root/a')).to eq(true)
    end

    it 'returns true if a node set is lower than another node set' do
      expect(evaluate_xpath(@document, 'root/a <= root/b')).to eq(true)
    end

    it 'returns true if a node set is equal to another node set' do
      expect(evaluate_xpath(@document, 'root/b <= root/b')).to eq(true)
    end
  end
end
