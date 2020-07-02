Given('I land on Home screen') do
  log("Landed on home screen......!")
  find_element(id: "action_search")
  find_element(id: "action_add_favorites")
end

Then('I press on Menu icon') do
  find_element(accessibility_id: "Open navigation drawer").click
  log("Pressed on menu icon..")
end

Then('I press on My conversions button') do
  text("My conversions").click
end

Then('I press on Create your first conversion button') do
  find_element(id: "btn_new_custom_conversion").click
end

Then('I type {string} as custom conversion name') do |convName|
  find_element(id: "edit_custom_conversion_category_name").send_keys(convName)
end

When('I press on New unit button') do
  find_element(id: "btn_new_custom_unit").click
end

Then('I type {string} as unit name') do |name|
  find_element(id: "edit_custom_conversion_unit_dtls_name").send_keys(name)
end

Then('I type {string} as unit symbol') do |symbol|
  find_element(id: "edit_custom_conversion_unit_dtls_symbol").send_keys(symbol)
end

Then('I type {string} as unit value') do |value|
  find_element(id: "edit_custom_conversion_unit_dtls_value").send_keys(value)
end

Then('I press submit checkmark on Custom conversions screen') do
  find_element(accessibility_id: "Confirm").click
end

When('I press on OK button on Custom conversions screen') do
  button("OK")
end

Then('I verify {string} added to Custom conversions list') do |convName|
  text(convName)
  log("New Conversion Created.")
end