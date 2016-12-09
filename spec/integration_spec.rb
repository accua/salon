require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe("The add stylist path", {:type => :feature}) do
  it("Takes the user input and creates a stylist object") do
    visit('/')
    fill_in('name', :with => "Jim")
    click_on("Add Stylist")
    visit('/')
    expect(page).to have_content "Jim"
  end
end
