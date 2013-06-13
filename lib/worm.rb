require 'frank-cucumber/console'
require 'screen'
require 'selector_builder'
require 'multi_json'

class Worm

  def initialize
    Frank::Cucumber::FrankHelper.use_shelley_from_now_on
  end

  def press(label)
    screen = Screen.new
    Frank::Console.new.touch(SelectorBuilder.build(screen.view_class(label), label))
  end

end


