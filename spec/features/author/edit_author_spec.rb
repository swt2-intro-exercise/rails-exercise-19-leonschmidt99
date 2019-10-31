describe "the author Editing page" do
  before :each do
    @author = create(:author)
    visit edit_author_path(@author)
  end

  it "should render without error" do
  end

  it "should contain input fields for first_name, last_name and hompage" do
    expect(page).to have_field('author[first_name]')
    expect(page).to have_field('author[last_name]')
    expect(page).to have_field('author[homepage]')
  end

  it "should successfully update the author's database entry" do
    page.fill_in 'author[first_name]', with: 'Nala'
    page.fill_in 'author[last_name]', with: 'Gnirut'
    page.fill_in 'author[homepage]', with: 'http://wikipedia.org/wiki/Nala_Gnirut'

    find('input[type="submit"]').click
    @author.reload

    expect(@author.first_name).to eq('Nala')
    expect(@author.last_name).to eq('Gnirut')
    expect(@author.homepage).to eq('http://wikipedia.org/wiki/Nala_Gnirut')
  end
    
end
