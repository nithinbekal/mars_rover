
$LOAD_PATH.push File.expand_path("../lib", __FILE__)

require 'rspec'
require 'mars_rover'

RSpec.configure do |config|
  config.color_enabled = true
  config.formatter     = 'documentation'
end

