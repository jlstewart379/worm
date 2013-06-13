class SelectorBuilder

  def self.build(type, label)
    "view:'#{type}' marked:'#{label}'"
  end
end