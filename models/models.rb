# Type: Module
require 'sequel'
require_relative './inventory/inv'
require_relative './industry/industry'

# This module contains the models for the application.
module Models
  PG_URI = 'postgres://amorris:maorris@localhost/eve_sde'.freeze
  DB = Sequel.connect PG_URI

  include Industry
  include Inventory

  def get_blueprint(bp_query)
    item_lookup(bp_query)
  end

  def item_lookup(item_query)
    InvType.where(Sequel.ilike(:typeName, item_query)).first
  end
end
