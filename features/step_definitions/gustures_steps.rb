When(/^I swipe from left to right$/) do
  Appium::TouchAction.new.swipe(start_x: 0.01, start_y: 0.5, end_x: 0.8, end_y: 0.5, duration: 600).perform
   f = screenshot_as :base64
     #attach("#{screenshot_file}", 'image/png')
     attach( f, 'image/png')
end

Then(/^I swipe from right to left$/) do
  Appium::TouchAction.new.swipe(start_x: 0.99 , start_y: 0.5, end_x: 0.01, end_y: 0.5, duration: 600).perform
end