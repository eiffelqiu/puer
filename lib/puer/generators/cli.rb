require 'rubygems'
require 'thor/group'
require 'cli-colorize'
require 'hirb'
require File.dirname(__FILE__) + '/../view'

module Puer
  module Generators
    ##
    # This class bootstrap +config/boot+ and perform +Puer::Generators.load_components!+ for handle
    # 3rd party generators
    #
    class Cli < Thor::Group
      include CLIColorize
      
      CLIColorize.default_color = :red
      
      RENDER_OPTIONS = { :fields => [:category,:command,:description] }   
      # Include related modules
      include Thor::Actions
      desc "Puer Version:\t#{Puer::Version::STRING}"
      class_option :help, :desc => "Help screen", :aliases => '-h', :type => :string
      
      # We need to TRY to load boot because some of our app dependencies maybe have
      # custom generators, so is necessary know who are.
      def load_boot
        begin
          ENV['BUNDLE_GEMFILE'] = File.join(options[:root], "Gemfile") if options[:root]
        rescue Exception => e
          puts "=> Problem loading #{boot}"
          puts ["=> #{e.message}", *e.backtrace].join("\n  ")
        end
      end

      def setup
        Puer::Generators.load_components!

        generator_kind  = ARGV.delete_at(0).to_s.downcase.to_sym if ARGV[0].present?
        generator_class = Puer::Generators.mappings[generator_kind]
        if generator_class
          args = ARGV.empty? && generator_class.require_arguments? ? ["-h"] : ARGV  
          generator_class.start(args)            
        else                 
          puts colorize( "Puer Version: #{Puer::Version::STRING}", { :foreground => :red, :background => :white, :config => :underline } )
          puts
          require 'yaml'
          gistfile = File.expand_path("~") + '/.puer/gist.yml'
          Gist::update_gist unless File.exist?(gistfile)          
          begin 
            g = YAML.load_file(gistfile)  
          rescue ArgumentError => e
            g = YAML.load_file(File.expand_path(File.dirname(__FILE__) + '/gist.yml'))
          end
          puts "notice: a new version '#{g['info']}' released" if g['info'] and g['info'].strip != "#{Puer::Version::STRING}"
          puts          
          puts "Puer is a Titanium Starter Project Generate Tool"
          puts          
          puts colorize("For more information")
          puts
          puts "puer help"
          puts
          puts colorize("Update latest repository info")
          puts
          puts "puer gist update"
          puts          
        end
      end
    end # Cli
  end # Generators
end # Puer