require('spec_helper')

describe(Stylist) do
  before :each do
    @stylist = Stylist.new({:name => "Felicia", :id => nil})
    @stylist_same = Stylist.new({:name => "Felicia", :id => nil})
    @stylist2 = Stylist.new({:name => "Stacy", :id => nil})
  end

  describe("#initialize") do
    it('will return the name and id of the stylist') do
      expect(@stylist.name).to eq "Felicia"
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
      @stylist = Stylist.new({:name => "Felicia"})
      @stylist.save
      expect(Stylist.all).to eq [@stylist]
    end
  end

  describe("#==") do
    it "will ensure that database entries are the same if they are of the same name" do
      @stylist.save
      @stylist_same.save
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
end
