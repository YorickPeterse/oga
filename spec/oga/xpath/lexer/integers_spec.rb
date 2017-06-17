require 'spec_helper'

describe Oga::XPath::Lexer do
  describe 'integers' do
    it 'lexes an integer' do
      expect(lex_xpath('10')).to eq([[:T_INT, 10]])
    end

    it 'lexes a negative integer' do
      expect(lex_xpath('-10')).to eq([[:T_INT, -10]])
    end
  end
end
