require 'spec_helper'

describe Oga::HTML::SaxParser do
  before do
    @handler = Class.new do
      attr_reader :name

      def on_element(namespace, name, attrs = {})
        @name = name
      end
    end
  end

  it 'uses custom callback methods if defined' do
    handler = @handler.new
    parser  = described_class.new(handler, '<link>')

    parser.parse

    expect(handler.name).to eq('link')
  end
end
