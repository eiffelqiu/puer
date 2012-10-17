require 'rbconfig'

module Puer
  ##
  # This method return the correct location of puer bin or
  # exec it using Kernel#system with the given args
  #
  def self.bin(*args)
    @_puer_bin ||= [self.ruby_command, File.expand_path("../../../bin/puer", __FILE__)]
    args.empty? ? @_puer_bin : system(args.unshift(@_puer_bin).join(" "))
  end

  ##
  # Return the path to the ruby interpreter taking into account multiple
  # installations and windows extensions.
  #
  def self.ruby_command
    @ruby_command ||= begin
      ruby = File.join(Config::CONFIG['bindir'], Config::CONFIG['ruby_install_name'])
      ruby << Config::CONFIG['EXEEXT']

      # escape string in case path to ruby executable contain spaces.
      ruby.sub!(/.*\s.*/m, '"\&"')
      ruby
    end
  end
end # Puer