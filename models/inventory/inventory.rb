module Inventory
  # Represents an inventory type in the database.
  class InvType < Sequel::Model(:invTypes)
    set_primary_key :typeID
    one_to_one :industryActivity, class: 'Models::IndustryActivity', key: :typeID
    many_to_one :group, class: 'Models::InvGroup', key: :groupID
  end

  # Represents an inventory group in the database.
  class InvGroup < Sequel::Model(:invGroups)
    set_primary_key :groupID
    one_to_many :types, class: 'Models::InvType', key: :groupID
    many_to_one :category, class: 'Models::InvCategory', key: :categoryID
  end

  # Represents an inventory category in the database.
  class InvCategory < Sequel::Model(:invCategories)
    set_primary_key :categoryID
    one_to_many :groups, class: 'Models::InvGroup', key: :categoryID
  end
end
