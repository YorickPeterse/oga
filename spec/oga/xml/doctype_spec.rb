require 'spec_helper'

describe Oga::XML::Doctype do
  context 'setting attributes' do
    example 'set the name via the constructor' do
      described_class.new(:name => 'html').name.should == 'html'
    end

    example 'set the name via a setter' do
      instance = described_class.new
      instance.name = 'html'

      instance.name.should == 'html'
    end
  end

  context '#to_html' do
    before do
      @instance = described_class.new
    end

    example 'to_xml should be aliased as to_html' do
      @instance.method(:to_xml).should == @instance.method(:to_html)
    end
  end

  context '#to_xml' do
    example 'generate a bare minimum representation' do
      described_class.new(:name => 'html').to_xml.should == '<!DOCTYPE html>'
    end

    example 'include the type if present' do
      instance = described_class.new(:name => 'html', :type => 'PUBLIC')

      instance.to_xml.should == '<!DOCTYPE html PUBLIC>'
    end

    example 'include the public ID if present' do
      instance = described_class.new(
        :name      => 'html',
        :type      => 'PUBLIC',
        :public_id => 'foo'
      )

      instance.to_xml.should == '<!DOCTYPE html PUBLIC "foo">'
    end

    example 'include the system ID if present' do
      instance = described_class.new(
        :name      => 'html',
        :type      => 'PUBLIC',
        :public_id => 'foo',
        :system_id => 'bar'
      )

      instance.to_xml.should == '<!DOCTYPE html PUBLIC "foo" "bar">'
    end

    example 'include the inline rules if present' do
      instance = described_class.new(
        :name         => 'html',
        :inline_rules => '<!ELEMENT foo>'
      )

      instance.to_xml.should == '<!DOCTYPE html [<!ELEMENT foo>]>'
    end
  end

  context '#inspect' do
    before do
      @instance = described_class.new(
        :name         => 'html',
        :type         => 'PUBLIC',
        :inline_rules => '<!ELEMENT foo>'
      )
    end

    example 'pretty-print the node' do
      @instance.inspect.should == <<-EOF.strip
Doctype(name: "html" type: "PUBLIC" inline_rules: "<!ELEMENT foo>")
      EOF
    end
  end
end
