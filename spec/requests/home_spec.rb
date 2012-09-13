describe "Home Page" do
  before do
    visit root_path
  end

  it "should have title as breaking" do
    page.should have_selector('h1', :text => "Breaking")
  end

  it "should have log in button" do
    pending "When designing log in"
  end

  it "should have sign up button" do
    pending "When designing sign up functionality."
  end

  it "should have experience button" do
    pending "After MVP"
  end
end
