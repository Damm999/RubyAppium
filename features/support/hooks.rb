require 'base64'

Before do
  log("Before <Hook> is executed....")
  $driver.start_driver
end

After do |scenario|
  log("After <Hook> is executed......")
  if scenario.failed?
    if !File.directory?("screnshots")
      FileUtils.mkdir_p("screnshots")
    end
    time_stamp = Time.now.strftime("%Y-%m-%d_%H.%M.%S")
    screenshot_name = time_stamp + ".png"
    screenshot_file = File.join("screnshots", screenshot_name)
   # $driver.screenshot(screenshot_file)
    screenshot screenshot_file
    #attach("#{screenshot_file}", 'image/png')
    attach( "FAIL_#{screenshot_file}.png", 'image/png')
    log("Screenshot Attached.....")
  end
  $driver.driver_quit
end

#AfterConfiguration do
#  FileUtils.rm_r("screenshots") if File.directory?("screnshots")
#end