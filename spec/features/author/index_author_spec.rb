require 'rails_helper'

describe "The Author index page" do
  
  before :each do
    @author = create(:author)
    visit authors_path
  end

  it "renders properly" do
  end

  it "contains a table" do
    expect(page).to have_css 'table'
  end

  it "contains a table with appropriately filled columns Name and Homepage" do
    within 'table' do
      expect(page).to have_text 'Name'
      expect(page).to have_text 'Homepage'

      expect(page).to have_text 'Alan Turing'
      expect(page).to have_text 'http://wikipedia.org/wiki/Alan_Turing'
    end
  end

  it "links to an authors detail page" do
    within 'table' do
      expect(page).to have_link 'Alan Turing', href: author_path(@author)
    end
  end

  it "contains a link to an authors editing page" do
    within 'table' do
      expect(page).to have_link 'Edit', href: edit_author_path(@author)
    end
  end

  it "contains a link to delete an author" do
    within 'table' do
      expect(page).to have_link 'Delete', href: author_path(@author)
    end
  end

  it "allows for deletion of an author when clicking the respective link" do
    within 'table' do
      prev_count = Author.count
      find('a[method="delete"]').click
      expect(prev_count).to eq(Author.count + 1)
    end
  end

  it "contains a link to add new authors" do
    expect(page).to have_link 'Add author', href: new_author_path
  end
    
end
