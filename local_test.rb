require 'rubygems'
require 'selenium-webdriver'

# Input capabilities
caps = Selenium::WebDriver::Remote::Capabilities.new
caps["browser"] = "Chrome"
caps["browser_version"] = "54.0"
caps["os"] = "Windows"
caps["os_version"] = "10"
caps["browserstack.debug"] = "true"
caps["browserstack.local"] = ENV['BROWSERSTACK_LOCAL']
caps["browserstack.localIdentifier"] = ENV['BROWSERSTACK_LOCAL_IDENTIFIER']
caps["build"] = "Supp Travis RUN"
caps["project"] = "Supp Travis RUN"
caps["name"] = "Local Test"

driver = Selenium::WebDriver.for(:remote,
  :url => "http://"+ENV['BROWSERSTACK_USER']+":"+ENV['BROWSERSTACK_ACCESS_KEY']+"@hub.browserstack.com/wd/hub",
  :desired_capabilities => caps)
driver.navigate.to "http://localhost"
puts driver.title
driver.quit