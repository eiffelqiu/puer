module Puer

  ##
  # This module it's used for bootstrap with puer rake
  # thirdy party tasks
  #
  # ==== Examples
  #
  #   Puer::Tasks.files << yourtask.rb
  #   Puer::Tasks.files.concat(Dir["/path/to/all/my/tasks/*.rb"])
  #   Puer::Tasks.files.unshift("yourtask.rb")
  #
  module Tasks

    ##
    # Returns a list of files to handle with puer rake
    #
    def self.files
      @files ||= Dir[File.dirname(__FILE__) + "/tasks/**/*.rb"]
    end
  end # Tasks
end # Puer