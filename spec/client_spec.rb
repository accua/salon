require('spec_helper')

describe(Client) do
  before :each do
    @client = Client.new({:name => "Felicia", :id => nil, :id_stylist => 1})
    @client_same = Client.new({:name => "Felicia", :id => nil, :id_stylist => 1})
    @client2 = Client.new({:name => "Stacy", :id => nil, :id_stylist => 1})
  end

  describe("#initialize") do
    it('will return the name and id of the client') do
      expect(@client.name).to eq "Felicia"
    end
  end

  describe(".all") do
    it "will return an empty array" do
      expect(Client.all).to eq []
    end
    it "will return the array of stylists" do
      @client.save
      expect(Client.all).to eq [@client]
    end
  end

  describe("#save") do
    it "will save the client entry to the database" do

      @client.save
      expect(Client.all).to eq [@client]
    end
  end

  describe("#==") do
    it "will ensure that database entries are the same if they are of the same name" do
      expect(@client).to eq @client_same
    end
  end

  describe(".find") do
    it "will return the client based on the id" do
      @client.save
      @client2.save
      expect(Client.find(@client2.id)).to eq @client2
    end
  end

  describe("#update") do
    it "will update information about the client" do
    @client.save
    @client.update({:name => "Margot"})
    expect(@client.name).to eq "Margot"
    end
  end

  describe("#delete") do
    it "will delete a client entry from the database" do
    @client.save
    @client2.save
    @client.delete
    expect(Client.all).to eq [@client2]
    end
  end
end
