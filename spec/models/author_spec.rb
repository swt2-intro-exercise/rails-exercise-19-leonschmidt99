require 'rails_helper'

describe "Author model", type: :model do

  before :each do
    # @author = Author.new(first_name: 'Alan', last_name: 'Turing', homepage: 'http://wikipedia.org/wiki/Alan_Turing')
    @author = build(:author)
  end

  it "should have attributes for first name, last name and homepage" do
    expect(@author.first_name).to eq('Alan')
    expect(@author.last_name).to eq('Turing')
    expect(@author.homepage).to eq('http://wikipedia.org/wiki/Alan_Turing')
  end

  it "should return the full name when calling name()" do
    expect(@author.name()).to eq('Alan Turing')
  end

  it "should not be able to have an empty last name" do
    @author.last_name = ""
    expect(@author).to_not be_valid
  end

end