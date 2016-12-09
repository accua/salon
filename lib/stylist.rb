class Stylist
  attr_reader(:name, :id)

  define_method(:initialize) do |attrs|
    @name = attrs[:name]
    @id = attrs[:id]
  end

  define_singleton_method(:all) do
    DB.exec('SELECT * FROM stylists;').map do |stylist|
      name = stylist.fetch("name")
      id = stylist.fetch("id").to_i
      Stylist.new({:name => name, :id => id})
    end
  end

  define_method(:==) do |other|
    @name == other.name and @id == other.id #and self.class == other.class
  end

  define_method(:save) do
    result = DB.exec("INSERT INTO stylists (name) VALUES ('#{@name}') RETURNING id;")
    @id = result.first.fetch("id").to_i
  end

  define_singleton_method(:find) do |id|
    stylist = DB.exec("SELECT * FROM stylists WHERE id = #{id};")
    name = stylist.first.fetch('name')
    id = stylist.first.fetch('id').to_i
    Stylist.new({:name => name, :id => id})
  end

  define_method(:update) do |attrs|
    @name = attrs.fetch(:name)
    DB.exec("UPDATE stylists SET name = '#{name}' WHERE id = #{id};")
  end

  define_method(:delete) do
    DB.exec("DELETE FROM stylists WHERE id = #{id};")
  end
end
