require 'rails_helper'

RSpec.describe "papers/show", type: :view do
  before(:each) do
  #  @paper = assign(:paper, Paper.create!(
  #    :title => "Title",
  #    :venue => "Venue",
  #    :year => 2
  #  ))
    @paper = create(:paper)
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/Venue/)
    expect(rendered).to match(/Year/)
    expect(rendered).to match(/Authors/)
  end

  it "contains a link to its author" do
    render
    expect(rendered).to have_link 'Alan Turing', href: author_path(@paper.authors.first)
  end
end
