require 'rails_helper'

describe "The Author index page" do
  
  before :each do
    @author = create(:author)
    visit authors_path
  end

  it "renders properly" do
  end

  it "contains a table with columns for Name and Homepage" do
    expect(page).to have_xpath('.//table/tr/th/Name')
    expect(page).to have_xpath('.//table/tr/th/Homepage')

    expect(page).to have_xpath('.//table/tr/td/Alan Turing')
    expect(page).to have_xpath('.//table/tr/td/http://wikipedia.org/wiki/Alan_Turing')
  end

  it "links to an authors detail page" do
    expect(page).to have_link 'Alan Turing', href: author_path(@author)
  end

  it "contains a link to add new authors" do
    expect(page).to have_link 'Add author', href: new_author_path
  end
    
end
