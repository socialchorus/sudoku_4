LIB_DIR = File.dirname(__FILE__) + "/../../lib"
SUP_DIR = File.dirname(__FILE__) + "/../../spec/support"
Dir.glob(LIB_DIR + "**/*.rb") { |file| require file }
Dir.glob(SUP_DIR + "**/*.rb") { |file| require file }
require 'stringio'

