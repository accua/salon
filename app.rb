require('sinatra')
require('sinatra/reloader')
require('pg')
require('./lib/stylist')
require('./lib/client')
also_reload('lib/**/*.rb')

if ENV['DATABASE_URL']
  DB = PG.connect(ENV['DATABASE_URL'])
else
  DB = PG.connect({:dbname => 'hair_salon_test'})
end

get("/") do
  @stylists = Stylist.all()
  erb(:index)
end

post("/stylists") do
  name = params.fetch("name")
  stylist = Stylist.new(:name => name, :id => nil)
  stylist.save()
  @stylists = Stylist.all()
  erb(:index)
end

get("/stylists/:id/edit") do
  @stylist = Stylist.find(params.fetch("id").to_i)
  erb(:stylist_edit)
end

patch("/stylists/:id") do
  name = params.fetch("name")
  @stylist = Stylist.find(params.fetch("id").to_i)
  @stylist.update({:name => name})
  @stylists = Stylist.all()
  erb(:index)
end

get("/stylists/:id/clients") do
  @stylist = Stylist.find(params.fetch("id").to_i)
  erb(:stylist)
end

post("/stylist/:id/clients") do
  name = params.fetch("name")
  id_stylist = params.fetch("id_stylist").to_i
  @stylist = Stylist.find(id_stylist)
  @client = Client.new(:name => name, :id_stylist => id_stylist)
  @client.save
  erb(:stylist)
end

get("/client/:id") do
  @client = Client.find(params.fetch("id").to_i)
  erb(:client)
end

patch("/client/:id") do
  name = params.fetch("name")
  @client = Client.find(params.fetch("id").to_i)
  @client.update({:name => name})
  @clients = Client.all()
  @stylist = Stylist.find(@client.id_stylist)
  erb(:stylist)
end

get("/method") do
  DB.exec("DELETE FROM clients *;")
  DB.exec("DELETE FROM stylists *;")
  redirect "/"
end
