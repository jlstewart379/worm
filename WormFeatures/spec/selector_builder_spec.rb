require 'spec_helper'
require 'selector_builder'

describe SelectorBuilder do
  context 'building a selector' do
    it 'should build a valid selector' do
      type = 'UILabel'
      label = 'testLabel'
      SelectorBuilder.build(type, label).should == "view:'UILabel' marked:'testLabel'"
    end

    it 'can build a selector for selecting a table index' do
      SelectorBuilder.table_index('tableView', 0).should == "view:'UITableView' marked:'tableView' tableViewCell index:0"
    end
  end
end