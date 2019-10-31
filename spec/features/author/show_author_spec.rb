require 'rails_helper'

describe "The Author Show page", type: :feature do

  before :each do
    @author = create(:author)
    visit author_path(@author)
  end
  
  it "shows the authors details" do
    expect(page).to have_text('First name: Alan')
    expect(page).to have_text('Last name: Turing')
    expect(page).to have_text('Homepage: http://wikipedia.org/wiki/Alan_Turing')
  end

end