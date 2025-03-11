#!/usr/bin/env ruby
require_relative 'models/models'
include Models

InvCategory.where(Sequel.ilike(:categoryName, 'ship')).first.groups.each do |group|
  group.types.each do |type|
    puts "#{type.typeName} (#{type.typeID})"
  end
end
