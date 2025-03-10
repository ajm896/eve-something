require "rest-client"
require "json"
require "sequel"
require "models"

marketDataURL = "https://esi.evetech.net/latest/markets/prices/?datasource=tranquility"
postgres_uri = "postgres://amorris:maorris@localhost/eve_sde"

filename = 'scratch'

DB = Sequel.connect postgres_uri

class InvType < Sequel::Model(:invTypes)
end

types = InvType.all
File.open filename, 'w' do |f|
  types.each {|item| f.puts(item[:typeName]) }
end


