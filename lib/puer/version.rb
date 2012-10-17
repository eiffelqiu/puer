module Puer
  module Version
    MAJOR = 0
    MINOR = 0
    PATCH = 0
    BUILD = '5'
    
    STRING = [MAJOR, MINOR, PATCH, BUILD].compact.join('.').chomp('.')
  end
end