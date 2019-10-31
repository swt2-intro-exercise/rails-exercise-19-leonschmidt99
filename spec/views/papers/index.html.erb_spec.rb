require 'rails_helper'

RSpec.describe "papers/index", type: :view do
  before(:each) do
=begin
    assign(:papers, [
      Paper.create!(
        :title => "Title",
        :venue => "Venue",
        :year => 2
      ),
      Paper.create!(
        :title => "Title",
        :venue => "Venue",
        :year => 2
      )
    ])
=end
  @papers = [create(:paper), create(:paper)]
  end

  it "renders a list of papers" do
    render
    assert_select "tr>td", :text => "COMPUTING MACHINERY AND INTELLIGENCE".to_s, :count => 2
    assert_select "tr>td", :text => "Mind 49: 433-460".to_s, :count => 2
    assert_select "tr>td", :text => 1950.to_s, :count => 2
  end

  #it "can be filtered according to year" do
  #  get :index, {:year => 1950}
  #  expect(rendered).to_not have_text("COMPUTING MACHINERY AND INTELLIGENCE")
  #end
end
