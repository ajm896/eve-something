require 'sequel'

module Config
  PG_URI = 'postgres://amorris:maorris@localhost/eve_sde'.freeze
  DB = Sequel.connect(PG_URI)
end
