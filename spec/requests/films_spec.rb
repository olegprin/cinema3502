require 'spec_helper'

describe "FilmsControllers" do

subject { page }
before { visit films_path }
  describe "GET /films_controllers" do
   
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      
     it { should have_title("All films")}
     it { should have_content("Список фильмов")}
 it "should have the right links on the layout" do
    visit films_path
    click_link "About"
    expect(page).to have_title(full_title('About Us'))

end
end
  end