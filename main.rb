#!/usr/bin/env ruby
require "sequel"
require_relative "models/models.rb"

include Models

DB[:invTypes].join(:industryActivity, typeID: :typeID).each do |row|
    puts row
end