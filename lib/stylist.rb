class Stylist
  attr_reader(:name)

  define_method(:initialize) do |attrs|
    @name = attrs[:name]
  end

  define_singleton_method(:all) do
    DB.exec('SELECT * FROM stylists;').map do |stylist|
      name = stylist.fetch("name")
      Stylist.new({:name => name})
    end
  end
end
