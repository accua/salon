require('spec_helper')

describe(Stylist) do
  describe("#initialize") do
    it('will return the name of the stylist') do
      stylist = Stylist.new({:name => "Felicia"})
      expect(stylist.name).to eq "Felicia"
    end
  end

  describe(".all") do
    it "will return all of the stylists" do
      expect(Stylist.all).to eq []
    end
  end
end
