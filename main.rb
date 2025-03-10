require "rest-client"
require "json"
require "sequel"
require_relative "models/models.rb"


marketDataURL = "https://esi.evetech.net/latest/markets/prices/?datasource=tranquility"

filename = 'scratch'



types = Models::InvType.all
File.open filename, 'w' do |f|
  types.each {|item| f.puts(item[:typeName]) }
end


