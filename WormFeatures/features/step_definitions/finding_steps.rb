Given(/^I am on the "([^"]*)"$/) do |page|
  on(WormPage).active?
end
Then(/^I can see that the label "([^"]*)" displays the text "([^"]*)"$/) do |which, text|
  on(WormPage).send("label_#{which}").should.eql?(text)
end