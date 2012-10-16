lib_dir = File.expand_path(File.join(File.dirname(__FILE__),'puer'))
unless $LOAD_PATH.include?(lib_dir)
  $LOAD_PATH << lib_dir
end

require 'xibtoti'
