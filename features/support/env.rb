require "em/pure_ruby"
require "appium_lib"
require "appium_lib_core"


def cap
  {
    caps: {
    deviceName: "emulator-5554",
    platformName: "Android",
    platformVersion: "10",
    app: "./app/original.apk",
    appPackage: "com.ba.universalconverter",
    appActivity: "MainConverterActivity",
    newCommandTimeout: "3600",
    automationName: "UiAutomator2",
    chromedriverExecutable: "./drivers/chromedriver.exe"
    },
    appium_lib: {
    wait_timeout: 30
    },
  }

end

Appium::Driver.new(cap,true)
Appium.promote_appium_methods Object



def find_in_list(unitConv)
  current_screen = get_source
  prev_screen = ""
  3.times{Appium::TouchAction.new.swipe(start_x: 0.5, start_y: 0.2, end_x: 0.5, end_y: 0.6, duration: 400).perform}
  until (exists{text_exact(unitConv)} || current_screen == prev_screen ) do
    Appium::TouchAction.new.swipe(start_x: 0.6, start_y: 0.8, end_x: 0.6, end_y: 0.2, duration: 400).perform
    prev_screen = current_screen
    current_screen = get_source
  end

  #find_element(:xpath, "//android.widget.ListView//android.widget.TextView[@text='#{unitConv}']").click
  if exists{text_exact(unitConv)}
    text_exact(unitConv).click
  else
    fail("#{unitConv} Element not found in the list")
  end
end