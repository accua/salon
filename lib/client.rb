class Client
  attr_reader(:name, :id, :id_stylist)

  define_method(:initialize) do |attrs|
    @name = attrs[:name]
    @id = attrs[:id]
    @id_stylist = attrs[:id_stylist]
  end

  define_singleton_method(:all) do
    DB.exec('SELECT * FROM clients;').map do |client|
      name = client.fetch("name")
      id = client.fetch("id").to_i
      stylist = client.fetch("id_stylist").to_i
      Client.new({:name => name, :id => id, :id_stylist => stylist})
    end
  end

  define_method(:==) do |other|
    @name == other.name and @id == other.id and @id_stylist == other.id_stylist #and self.class == other.class
  end

  define_method(:save) do
    result = DB.exec("INSERT INTO clients (name, id_stylist) VALUES ('#{@name}', #{@id_stylist}) RETURNING id;")
    @id = result.first.fetch("id").to_i
  end

  define_singleton_method(:find) do |id|
    client = DB.exec("SELECT * FROM clients WHERE id = #{id};")
    name = client.first.fetch('name')
    id = client.first.fetch('id').to_i
    stylist = client.first.fetch('id_stylist').to_i
    Client.new({:name => name, :id => id, :id_stylist => stylist})
  end

  define_method(:update) do |attrs|
    @name = attrs.fetch(:name, @name)
    @id_stylist = attrs.fetch(:id_stylist, @id_stylist)
    DB.exec("UPDATE clients SET name = '#{name}', id_stylist = #{id_stylist} WHERE id = #{id};")
  end

  define_method(:delete) do
    DB.exec("DELETE FROM clients WHERE id = #{id};")
  end
end
