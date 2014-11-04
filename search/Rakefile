#!/usr/bin/env rake
# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)
require 'csv' 
Search::Application.load_tasks

task :populate_db do
	Rake::Task["migration:populate_lawyers"].invoke
	Rake::Task["migration:populate_services"].invoke
end