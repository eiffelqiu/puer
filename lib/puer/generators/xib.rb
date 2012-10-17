require 'rubygems'
require 'cli-colorize'
require 'thor/group'
require 'hirb'
require File.dirname(__FILE__) + '/../view'
require File.dirname(__FILE__) + '/jam'

require File.dirname(__FILE__) + '/../converters'
require File.dirname(__FILE__) + '/../nodes'
require File.dirname(__FILE__) + '/../session'
require File.dirname(__FILE__) + '/../xibtoti'
require File.dirname(__FILE__) + '/../config'

module Puer
  module Generators
    class Xib < Jam
      include CLIColorize
      
      CLIColorize.default_color = :red
      RENDER_OPTIONS = { :fields => [:category,:command,:description] }   
            
      # Add this generator to our puer
      Puer::Generators.add_generator(:xib, self)

      # Define the source root
      def self.source_root; File.expand_path(File.dirname(__FILE__)); end
      def self.banner; "puer xib [option]"; end

      # Include related modules
      include Thor::Actions
      include Puer::Generators::Actions            

      desc "Description:\n\n\tpuer will xib option"

      argument :name, :desc => "The name of option"

      def in_app_root?
        # File.exist?('Classes')
        Dir.glob("tiapp.xml").count >= 1
      end     

      def create_xib
        Dir.glob(File.join('**','*.xib')).each do |s| 
            puts "#{s} is converted to #{File.basename(s, '.*')}.js "
            #system "puer #{s} -o #{File.basename(s, '.*')}.js" 

            $config.parse_file s
            if $config.has_errors?
              puts "Aborted!"
              puts $config.full_log [:error]
            else  
              severities = []
              #severities.unshift :warning if @show_warnings
              log = $config.full_log severities
              script = js_comments_for(log) + js_for($config.out)
              @output_file = "#{File.basename(s, '.*')}.js"
              File.open(@output_file, 'w') do |file|
                file.write script
              end
              #puts log
            end
        end       
        puts     
      end

    end # Xib
  end # Generators
end # Puer

