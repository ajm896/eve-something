# Type: Module
require_relative '../config/database'
require_relative './inventory/inventory'
require_relative './industry/industry'

# This module contains the models for the application.
module Models
  include Config
  include Industry
  include Inventory

  def self.get_blueprint(bp_query)
    item_lookup(bp_query)
  end

  def self.item_lookup(item_query)
    InvType.where(Sequel.ilike(:typeName, item_query)).first
  end
end
