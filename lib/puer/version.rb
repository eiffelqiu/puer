module Puer
  module Version
    MAJOR = 0
    MINOR = 0
    PATCH = 5
    
    STRING = [MAJOR, MINOR, PATCH].compact.join('.').chomp('.')
  end
end