#!/usr/bin/env ruby
# frozen_string_literal: true

require_relative 'models/models'
require_relative 'config/database'

module Main # rubocop:disable Style/Documentation
  include Models

  def self.print_item(bluep)
    if bluep
      print_blueprint_details(bluep)
    else
      puts "No blueprint found with the name '#{blueprint_name}'."
    end
  end

  def self.print_blueprint_details(bluep)
    puts "Found blueprint: #{bluep.typeName} (ID: #{bluep.typeID})"
    puts "Group: #{bluep.group.groupName} (ID: #{bluep.group.groupID})"
    puts "Category: #{bluep.group.category.categoryName} (ID: #{bluep.group.category.categoryID})"
  end

  def self.run
    # Example usage of the models
    puts 'Welcome to the Eve SDE Query Tool!'
    puts 'Please enter a blueprint name to search for:'
    blueprint_name = gets.chomp
    bluep = Models.get_blueprint(blueprint_name)
    print_item(bluep)
  end
end

Main.run
