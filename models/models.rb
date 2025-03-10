module Models
postgres_uri = "postgres://amorris:maorris@localhost/eve_sde"
DB = Sequel.connect postgres_uri
class InvType < Sequel::Model(:invTypes)
end
end
