class Stylist
  attr_reader(:name, :id)

  define_method(:initialize) do |attrs|
    @name = attrs[:name]
    @id = attrs[:id]
  end

  define_singleton_method(:all) do
    DB.exec('SELECT * FROM stylists;').map do |stylist|
      name = stylist.fetch("name")
      Stylist.new({:name => name})
    end
  end

  #rescue false might be necessary if .name method cannot be run on a string
  define_method(:==) do |other|
    @name = other.name and @id = other.id
  end

  define_method(:save) do
    result = DB.exec("INSERT INTO stylists (name) VALUES ('#{@name}') RETURNING id;")
    @id = result.first.fetch("id").to_i
  end

  define_singleton_method(:find) do
    result = DB.exec("SELECT * FROM stylists WHERE id = #{id}")
  end
end
