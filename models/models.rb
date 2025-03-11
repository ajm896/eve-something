# This module contains the models for the application.
require 'sequel'
module Models
  postgres_uri = 'postgres://amorris:maorris@localhost/eve_sde'
  DB = Sequel.connect postgres_uri

  # Represents an inventory type in the database.
  class InvType < Sequel::Model(:invTypes)
    set_primary_key :typeID
    one_to_one :industryActivity, class: 'Models::IndustryActivity', key: :typeID
  end

  # Represents the materials required for an industry activity.
  class IndustryActivityMaterial < Sequel::Model(:industryActivityMaterials)
    set_primary_key %i[typeID materialTypeID] # Composite primary key
    many_to_one :blueprint, class: 'Models::InvType', key: :typeID
    many_to_one :material, class: 'Models::InvType', key: :materialTypeID
  end

  # Represents an industry activity in the database.
  class IndustryActivity < Sequel::Model(:industryActivity)
    set_primary_key %i[typeID activityID] # Composite primary key
    many_to_one :blueprint, class: 'Models::InvType', key: :typeID
    many_to_one :activity, class: 'Models::RamActivity', key: :activityID
    # one_to_many :materials, class: 'Models::IndustryActivityMaterial', key: :typeID
  end

  # Represents the products of an industry activity.
  class IndustryActivityProduct < Sequel::Model(:industryActivityProducts)
    set_primary_key %i[typeID productTypeID] # Composite primary key
    many_to_one :blueprint, class: 'Models::InvType', key: :typeID
    many_to_one :product, class: 'Models::InvType', key: :productTypeID
  end

  # Represents a RAM activity in the database.
  class RamActivity < Sequel::Model(:ramActivities)
    set_primary_key :activityID
    one_to_one :IndustryActivity, class: 'Models::IndustryActivity', key: :activityID
  end

  # Allows us to get the end result of a blueprint.
  class IndustryActivityProduct < Sequel::Model(:industryActivityProducts)
    set_primary_key %i[typeID productTypeID] # Composite primary key
    many_to_one :blueprint, class: 'Models::InvType', key: :typeID
    many_to_one :product, class: 'Models::InvType', key: :productTypeID
  end

  def get_blueprint(bp_query)
    InvType.where(typeName: bp_query).first
  end
end
