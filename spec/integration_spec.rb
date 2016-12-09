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

describe("The clear stylist path", {:type => :feature}) do
  it("Clears the database") do
    visit('/')
    fill_in('name', :with => "Jim")
    click_on("Add Stylist")
    visit('/')
    fill_in('name', :with => "John")
    click_on("Add Stylist")
    visit('/')
    click_on("Clear Stylists")
    expect(page).to have_content "There are no stylists yet!"
  end
end

describe("The edit stylist path", {:type => :feature}) do
  it("Takes the user to the edit stylist form") do
    visit('/')
    fill_in('name', :with => "Jim")
    click_on("Add Stylist")
    visit('/')
    click_on("mode_edit")
    expect(page).to have_content "Update Jim"
  end
end
