require 'rails_helper'

describe "New author page", type: :feature do
  
  before :each do
    visit new_author_path
  end

  it "should render withour error" do
  end

  it "should contain text input fields for first_name, last_name and homepage" do
    expect(page).to have_field('author[first_name]')
    expect(page).to have_field('author[last_name]')
    expect(page).to have_field('author[homepage]')
  end

  it "should contain a button for submitting the form" do
    expect(page).to have_css('input[type="submit"]')
  end

  it "should be able to create a new Author entry in the database" do
    page.fill_in 'author[first_name]', with: 'Alan'
    page.fill_in 'author[last_name]', with: 'Turing'
    page.fill_in 'author[homepage]', with: 'http://wikipedia.org/wiki/Alan_Turing'

    find('input[type="submit"]').click
  end

  it "should display an error message when filling in invalid values" do
    page.fill_in 'author[first_name]', with: 'Alan'
    page.fill_in 'author[last_name]', with: ''
    page.fill_in 'author[homepage]', with: 'http://wikipedia.org/wiki/Alan_Turing'

    find('input[type="submit"]').click
    expect(page).to have_text 'error'
  end
end