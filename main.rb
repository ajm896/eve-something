#!/usr/bin/env ruby
# frozen_string_literal: true

require_relative 'models/models'
require_relative 'config/database'

# Main module for the Eve SDE Query Tool.
# This module includes methods to interact with blueprints and print their details.
module Main
  include Models

  def self.print_item(blueprint)
    if blueprint
      print_blueprint_details(blueprint)
    else
      puts 'No blueprint found with that name.'
    end
  end

  def self.print_blueprint_details(blueprint)
    puts "Found blueprint: #{blueprint.typeName} (ID: #{blueprint.typeID})"
    puts "Group: #{blueprint.group.groupName} (ID: #{blueprint.group.groupID})"
    puts "Category: #{blueprint.group.category.categoryName} (ID: #{blueprint.group.category.categoryID})"
  rescue NoMethodError
    puts 'Error: Blueprint details are incomplete or invalid.'
  end

  def self.run
    # Example usage of the models
    puts 'Please enter a blueprint name to search for:'
    blueprint_name = gets.chomp
    blueprint = Models.get_blueprint(blueprint_name)
    print_item(blueprint)
  end
end

Main.run
