require 'spec_helper'
require 'selector_builder'

describe SelectorBuilder do
  context 'building a selector' do
    it 'should build a valid selector' do
      type = 'UILabel'
      label = 'testLabel'
      SelectorBuilder.build(type, label).should == "view:'UILabel' marked:'testLabel'"
    end
  end
end