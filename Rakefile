# frozen_string_literal: true

# Rakefile
require 'rake'
require 'sequel'
# require 'dotenv/load' if File.exist?('.env') # Load .env file if present
require_relative 'config/database' # Load database connection

task :default do
  system('./main.rb')
end

namespace :db do
  include Config
  desc 'Test database connection'
  task :connect do
    puts "Connected to: #{DB.uri}"
    puts "Tables: #{DB.tables.join(', ')}"
  end
end

namespace :test do
  desc 'Run all tests'
  task :run do
    system('ruby -Itest test/*_test.rb')
  end
end
