TEMPLATE = <<-BLOCK
require File.dirname(__FILE__) + '/jam'

module Puer
  module Generators
    class Template < Jam

      # Add this generator to our puer
      Puer::Generators.add_generator(:template, self)

      # Define the source template root
      def self.source_root; File.expand_path(File.dirname(__FILE__)); end
      def self.banner; "puer template [name]"; end

      # Include related modules
      include Thor::Actions
      include Puer::Generators::Actions            

      desc "Description:\\n\\n\\tpuer will generates an new PureMvc Model for iphone"

      argument :name, :desc => "The name of your puremvc model"

      class_option :root, :desc => "The root destination", :aliases => '-r', :default => ".", :type => :string
      class_option :destroy, :aliases => '-d', :default => false,   :type    => :boolean

      def in_app_root?
        Dir.glob("tiapp.xml").count >= 1
      end     

      def create_app
        valid_constant?(options[:template] || name)
        @project_name = (options[:app] || name).gsub(/\W/, "_").downcase
        @class_name = (options[:app] || name).gsub(/\W/, "_").capitalize
        @developer = "#{`whoami`.strip}"
        @created_on = Date.today.to_s
        self.destination_root = options[:root]
                
        eval(File.read(__FILE__) =~ /^__END__\n/ && $' || '')

say (<<-TEXT).gsub(/ {10}/,'')

=================================================================
Your template has been generated.
=================================================================

TEXT          
        end

    end # Template
  end # Generators
end # Puer

__END__
# put your template command here

BLOCK

namespace :puer do
  namespace :plugin do

    desc 'Create an plugin structure for puer'
    task :create  do
      puts "what's your plugin name?"
      pname = STDIN.gets.chomp
      plugin_dir = File.dirname(__FILE__) + "/../generators/#{pname}"
      plugin_name = File.dirname(__FILE__) + "/../generators/#{pname}.rb"
      Dir.mkdir plugin_dir unless File.exist?(plugin_dir)
      File.open(plugin_name, 'w') {|f| f.write(TEMPLATE) }  
    end
    
  end # plugin
end # puer

