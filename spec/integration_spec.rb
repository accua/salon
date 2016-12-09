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

describe("The update stylist name path", {:type => :feature}) do
  it("Clears the database") do
    visit('/')
    fill_in('name', :with => "Jim")
    click_on("Add Stylist")
    visit('/')
    click_on("mode_edit")
    fill_in('name', :with => "Susan")
    click_on('Update')
    expect(page).to have_content "Susan"
  end
end

describe("The delete stylist path", {:type => :feature}) do
  it("Clears the database of the selected stylist") do
    visit('/')
    fill_in('name', :with => "Jim")
    click_on("Add Stylist")
    visit('/')
    click_on("mode_edit")
    click_on('Delete')
    expect(page).to have_content "There are no stylists yet!"
  end
end

describe("The add client to stylist path", {:type => :feature}) do
  it("Adds a client to a stylist") do
    visit('/')
    fill_in('name', :with => "Jim")
    click_on("Add Stylist")
    visit('/')
    click_on("Jim")
    fill_in('name', :with => "Chloe")
    click_on('Add Client')
    expect(page).to have_content "Chloe"
  end
end

describe("The home path from the stylist page", {:type => :feature}) do
  it("Takes the user home from the stylist page") do
    visit('/')
    fill_in('name', :with => "Jim")
    click_on("Add Stylist")
    visit('/')
    click_on("Jim")
    click_on("Home")
    expect(page).to have_content "Jim"
  end
end

describe("The edit client page", {:type => :feature}) do
  it("Takes the user home from the stylist page") do
    visit('/')
    fill_in('name', :with => "Jim")
    click_on("Add Stylist")
    visit('/')
    click_on("Jim")
    fill_in('name', :with => "Chloe")
    click_on('Add Client')
    click_on('Chloe')
    expect(page).to have_content "Update Chloe"
  end
end

describe("The update client path", {:type => :feature}) do
  it("Updates the client name") do
    visit('/')
    fill_in('name', :with => "Jim")
    click_on("Add Stylist")
    visit('/')
    click_on("Jim")
    fill_in('name', :with => "Chloe")
    click_on('Add Client')
    click_on('Chloe')
    fill_in('name', :with => "Josh")
    click_on('Update')
    expect(page).to have_content "Josh"
  end
end

describe("The delete client path", {:type => :feature}) do
  it("Deletes the client from the database") do
    visit('/')
    fill_in('name', :with => "Jim")
    click_on("Add Stylist")
    visit('/')
    click_on("Jim")
    fill_in('name', :with => "Chloe")
    click_on('Add Client')
    click_on('Chloe')
    click_on('Delete')
    expect(page).to have_content "There are no clients assigned to this stylist!"
  end
end

describe("The home path from the client page", {:type => :feature}) do
  it("Takes the user back to the index page") do
    visit('/')
    fill_in('name', :with => "Jim")
    click_on("Add Stylist")
    visit('/')
    click_on("Jim")
    fill_in('name', :with => "Chloe")
    click_on('Add Client')
    click_on('Chloe')
    click_on('Home')
    expect(page).to have_content "Hair Salon"
  end
end
