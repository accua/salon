require('spec_helper')

describe(Stylist) do
  before :each do
    @stylist = Stylist.new({:name => "Amy", :id => nil})
    @stylist_same = Stylist.new({:name => "Amy", :id => nil})
    @stylist2 = Stylist.new({:name => "Stacy", :id => nil})
  end

  describe("#initialize") do
    it('will return the name and id of the stylist') do
      expect(@stylist.name).to eq "Amy"
    end
  end

  describe(".all") do
    it "will return an empty array" do
      expect(Stylist.all).to eq []
    end
    it "will return the array of stylists" do
      @stylist.save
      expect(Stylist.all).to eq [@stylist]
    end
  end

  describe("#save") do
    it "will save the stylist entry to the database" do
      @stylist = Stylist.new({:name => "Amy"})
      @stylist.save
      expect(Stylist.all).to eq [@stylist]
    end
  end

  describe("#==") do
    it "will ensure that database entries are the same if they are of the same name" do
      expect(@stylist).to eq @stylist_same
    end
  end

  describe(".find") do
    it "will return the stylist based on the id" do
      @stylist.save
      @stylist2.save
      expect(Stylist.find(@stylist2.id)).to eq @stylist2
    end
  end

  describe("#get_clients") do
    it "will return the clients belonging to the stylist" do
           @stylist.save
           fk = @stylist.id
           @client4 = Client.new({:name => "Margot", :id => nil, :id_stylist => fk})
           @client5 = Client.new({:name => "Amy", :id => nil, :id_stylist => 1})
           @client6 = Client.new({:name => "Stacy", :id => nil, :id_stylist => fk})
           @client4.save
           @client5.save
           @client6.save
     expect(@stylist.get_clients).to eq [@client4, @client6]
   end
  end

  describe("#update") do
    it "will update information about the stylist" do
    @stylist.save
    @stylist.update({:name => "Margot"})
    expect(@stylist.name).to eq "Margot"
    end
  end

  describe("#delete") do
    it "will delete a stylist entry from the database" do
    @stylist.save
    @stylist2.save
    @stylist.delete
    expect(Stylist.all).to eq [@stylist2]
    end
  end
end
