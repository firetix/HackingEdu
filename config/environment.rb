# Load the Rails application.
require File.expand_path('../application', __FILE__)

Rails.logger = Le.new('ede2cf55-7da4-4d14-8388-af037d3f19da', :debug => true, :local => true)
# Initialize the Rails application.
Rails.application.initialize!
