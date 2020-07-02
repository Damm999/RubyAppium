Given('I land on Home Screen') do
  find_element(id: "action_search")
  find_element(id: "action_add_favorites")
  log('Landed on Home Screen.')
end

Then('Left Unit Picker value should be Foot') do
  text("Foot")
  log('Left unit picker value is Foot')

end

Then('Right Unit Picker value should be Centimeter') do
  text("Centimeter")
  log('Right unit picker value is centimeter.')
end

Then('Left Unit Picker value should be {string}') do |unitValue|
  acutalText = find_element(id: "select_unit_spinner").text

  if acutalText != unitValue
    fail("Expected value: #{unitValue}, but found: #{acutalText}")
  else
    log("Left unit picker value is : #{unitValue}")
  end
  text(unitValue)
end

Then('Right Unit Picker value should be {string}') do |unitValue|
  acutalText = find_elements(:id ,'select_unit_spinner')
  sample = acutalText[1].text
  # acutalText.each do |converters|
  #   log(converters.text)
  # end
  log(sample)
  if sample != unitValue
    fail("Expected value: #{unitValue}, but found: #{sample}")
  else
    log("Right unit picker value is : #{unitValue}")
  end
  text(unitValue)
end

# Using State variable to capture the state of expression
Then(/^Show All button should be (enabled|disabled).$/) do |state|

  c = find_element(id: "btn_show_all").enabled?

  if state=="enabled"
    log("enabled logic..")
    if c == true
      log("Show all button is #{state}")
    else
      fail("expected button to be enabled.")
    end
  elsif state=="disabled"
    log("disabled logic..")
    if c == false
      log("Show all button is #{state}")
    else
      fail("expected button to be disabled.")
    end
  end
end

When('I press on clear button') do
  button("C").click
  log('Clear button is pressed.')
end

When('I type {string} to target text field.') do |value|
  log("I entered: #{value}")
  value = value.split("")
  value.each do |digit|
    button(digit).click
  end
  log("I Clicked on: #{value}")
end

Then('I should see result as {string}') do |result|
  log("result: #{result}")
  resultValue = find_element(id: "target_value").text
  log(" result value from app: #{resultValue}")
  if resultValue != result
    fail("result is not same: #{resultValue}")
  end

  log("Verified the output")
end

Then('I press on Add to Fav Icon') do
  find_element(accessibility_id: "Add to favorites").click
  log("Clicked on Add to Fav Icon.")
end

When('I press on Menu Icon') do
  find_element(accessibility_id: "Open navigation drawer").click
  log("Clicked on Menu Icon")
end

Then('I select {string} tab') do |tabIcon|
  text(tabIcon).click
  log("Selected on #{tabIcon} tab")
end

Then('I verify {string} added to Fav Conversions List') do |valueOnScreen|
  conversionType = find_element(id: "favorites_item_hint").text
  if conversionType != valueOnScreen
    fail("Cannot find the conversion type saved in favourite's Conversation Screen. ")
  end
  log("Favorite conversions screen is verified.")
end

Then('I press on serch icon') do
  find_element(id: "action_search").click
  log('Clicked on Search Icon')
end

Then('I type {string} in search feild') do |searchParameter|
  find_element(id: 'search_src_text').send_keys(searchParameter)
end

Then('I press {string} button on my soft keyboard') do |keyboardSelection|
  sleep 3
  Appium::TouchAction.new.tap(x: 0.99, y: 0.99, count: 1).perform
  log("touched on #{keyboardSelection} from keyboard.")
end

Then('I see {string} as my current unit converter') do |searchPageKeyword|
  # text(searchPageKeyword)
  check = find_element(id: "action_bar").find_element(xpath: "//android.widget.TextView[@text='#{searchPageKeyword}']").text
  if check !=searchPageKeyword
    fail("App is not navigated to: #{searchPageKeyword} page.")
  else
    log("app navigate to: #{searchPageKeyword} page")
  end
end

Then('I select {string} from {string} unit picker') do |unitConv, picker|
  value = 0
  value = 1 if picker.downcase == "right"
  find_elements(:id ,'select_unit_spinner')[value].click
  find_in_list(unitConv)
  log("User selected #{unitConv} from #{picker} unit picker")

end

Then('I select {string} from side menu') do |menuOption|
  text(menuOption).click
  log("Selected #{menuOption} from side menu")
end

When('I click on swap pickers') do
  find_element(accessibility_id: "Swap units").click
end

Then(/^I select "([^"]*)" from menu$/) do |value|
  text(value).click
end

Then(/^I select "([^"]*)" from right unit picker$/) do |value|
  find_elements(id: "select_unit_spinner")[1].click
  find_in_list(value)
end

Then(/^I should see text "([^"]*)"$/) do |value|
  text(value)
end

Then(/^I verify that (\d+)(?:st|nd|rd|th)? result in history list is "([^"]*)"$/) do |index, text|
  parent_element = find_element(id: "history_conversion_list")
  array_of_elements = parent_element.find_elements(id: "history_single_line")
  actual_text = array_of_elements[index.to_i - 1].find_element(id: "history_item_hint").text
  if actual_text != text
    fail("Expected text is #{text}, actual text is #{actual_text}")
  end
end

When(/^I press delete from history at (\d+)st row$/) do |index|
  parent_element = find_element(id: "history_conversion_list")
  array_of_elements = parent_element.find_elements(id: "history_single_line")
  array_of_elements[index.to_i - 1].find_element(id: "deleteIcon").click
end


Then(/^I see "([^"]*)" as a current unit converter$/) do |current_unit|
  find_element(id: "action_bar").find_element(xpath: "//android.widget.TextView[@text='#{current_unit}']")
end

When(/^I type "([^"]*)" on application keyboard$/) do |target|
  digits = target.split("")

  digits.each do |num|
    find_element(id: "keypad").find_element(xpath: "//android.widget.Button[@text='#{num}']").click
  end
end