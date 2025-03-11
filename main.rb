#!/usr/bin/env ruby
require_relative 'models/models'
require_relative 'config/database'
include Models

InvGroup.where(Sequel.ilike(:groupName, 'frigate')).first.types.each do |type|
  puts "#{type.typeName} is a frigate and costs #{type.basePrice || 'not for sale'} ISK."
end
