module Models

postgres_uri = "postgres://amorris:maorris@localhost/eve_sde"
DB = Sequel.connect postgres_uri

  class InvType < Sequel::Model(:invTypes)
    set_primary_key :typeID
  end

  class IndustryActivityMaterial < Sequel::Model(:industryActivityMaterials)
    set_primary_key [:typeID, :materialTypeID] # Composite primary key
    many_to_one :blueprint, class: 'Models::InvType', key: :typeID
    many_to_one :material, class: 'Models::InvType', key: :materialTypeID
  end
end
