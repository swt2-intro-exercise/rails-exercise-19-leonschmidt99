require 'rails_helper'

describe "New author page", type: :feature do
  
  it "should render withour error" do
    visit new_author_path
  end

  it "should contain text input fields for first_name, last_name and homepage" do
    visit new_author_path

    expect(page).to have_field('author[first_name]')
    expect(page).to have_field('author[last_name]')
    expect(page).to have_field('author[homepage]')
  end

  it "should contain a button for submitting the form" do
    visit new_author_path

    expect(page).to have_css('input[type="submit"]')
  end
end