require 'rubygems'
require 'rake'

  task :test  do
    Dir[File.dirname(__FILE__)+"/test/*.rb"].each do |test|
       require test
    end
   # ruby "test/test_application.rb"
  end

  namespace :db do
    task :create do
      require "create_db.rb"
    end
  end
