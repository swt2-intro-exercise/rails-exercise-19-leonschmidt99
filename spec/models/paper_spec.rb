require 'rails_helper'

RSpec.describe Paper, type: :model do
  before :each do
    @paper = build(:paper)
  end

  it "does not validate without title" do
    @paper.title = nil
    expect(@paper).to_not be_valid
  end

  it "does not validate without venue" do
    @paper.venue = nil
    expect(@paper).to_not be_valid
  end

  it "does not validate without a numeral for a year" do
    @paper.year = nil
    expect(@paper).to_not be_valid
  end
end
