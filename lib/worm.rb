require 'frank-cucumber/console'
require 'frank-cucumber/frank_helper'
require 'screen'
require 'selector_builder'
require 'multi_json'

class Worm
  include Frank::Cucumber::FrankHelper

  def initialize
    Frank::Cucumber::FrankHelper.use_shelley_from_now_on
  end

  def use_physical
    Frank::Cucumber::FrankHelper.test_on_physical_device_via_bonjour
  end

  def press(label)
    screen = Screen.new
    Frank::Console.new.touch(SelectorBuilder.build(screen.view_class(label), label))
  end

  def buttons
    Screen.new.accessible_buttons
  end

  def text_fields
    Screen.new.accessible_text_fields
  end

  def labels
    Screen.new.accessible_labels
  end

  def tables
    Screen.new.accessible_tables
  end

  def set_text(text, label)
    screen = Screen.new
    Frank::Console.new.touch(SelectorBuilder.build(screen.view_class(label), text))
  end

  def type(text)
    Frank::Console.new.type_into_keyboard(text)
  end

  def landscape
    frankly_set_orientation('landscape')
  end

  def portrait
    frankly_set_orientation('portrait')
  end

  def touch_alert(button)
    touch("view:'UIAlertButton' marked:'#{button}'")
  end
end


