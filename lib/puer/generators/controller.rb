require 'rubygems'
require 'cli-colorize'
require 'hirb'
require File.dirname(__FILE__) + '/../view'
require File.dirname(__FILE__) + '/jam'

module Puer
  module Generators
    class Controller < Jam
      include CLIColorize
      
      CLIColorize.default_color = :red
      author 'Eiffel Qiu'
      homepage 'http://www.likenote.com'
      email 'eiffelqiu@gmail.com'
      version Puer::Version::STRING   
      
      # Add this generator to our appjam
      Puer::Generators.add_generator(:controller, self)
  
      init_generator      

      desc "Description:\n\n\tpuer will generates an new Controller for titanium"

      argument :name, :desc => "The name of your titanium controller"

      class_option :root, :desc => "The root destination", :aliases => '-r', :default => ".", :type => :string
      class_option :destroy, :aliases => '-d', :default => false,   :type    => :boolean

      def create_controller
        if in_app_root?
          valid_constant?(options[:model] || name)
          @controller_name = (options[:model] || name).gsub(/\W/, "_").downcase
          @class_name = (options[:model] || name).gsub(/\W/, "_").capitalize
          @developer = "#{`whoami`.strip}"
          @created_on = Date.today.to_s
          self.destination_root = options[:root]
          self.behavior = :revoke if options[:destroy]
          
          puts colorize( "Puer Version: #{Puer::Version::STRING}", { :foreground => :red, :background => :white, :config => :underline } )
          puts          
          eval(File.read(__FILE__) =~ /^__END__\n/ && $' || '')

          say (<<-TEXT).gsub(/ {10}/,'')
      
      =================================================================
      Your [#{@controller_name.capitalize}] Controller has been generated.
      Build and Run
      =================================================================
      
        TEXT
        else 
          puts
          puts '-'*70
          puts "You are not in a titanium project folder"
          puts '-'*70
          puts
        end
      end
    end # Model
  end # Generators
end # Puer

__END__
template "templates/controller.tt" , "Resources/controllers/#{@controller_name}.js"
template "templates/view.tt" , "Resources/views/#{@controller_name}.js"