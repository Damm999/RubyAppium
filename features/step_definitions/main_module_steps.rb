Given(/^I land on home screen$/)do
  log("Landed on home screen......!")
  find_element(id: "action_search")
  find_element(id: "action_add_favorites")
end

When('I press on the menu Icon') do
  sleep 3
  find_element(accessibility_id: "Open navigation drawer").click
  log("Pressed on menu icon..")
end

Then('I should see left side menu') do
  text("Unit Converter")
  #find_element(id: "drawerCategoryName")
  log("Left side menu is visible")
end

When('I press on my conversation button') do
  text("My conversions").click
  log("Clicked on my Conversation screen button")
end

Then('I land on My Conversation Screen') do
  find_element(id: "btn_new_custom_conversion")
  log("Conversation screen is opened.")
end