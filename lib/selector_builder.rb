class SelectorBuilder

  def self.build(type, label)
    "view:'#{type}' marked:'#{label}'"
  end

  def self.table_index(label, index)
    "#{self.build('UITableView',label)} tableViewCell index:#{index}"
  end
end