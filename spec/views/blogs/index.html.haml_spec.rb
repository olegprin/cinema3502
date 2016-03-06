require 'rails_helper'

RSpec.describe "blogs/index", type: :view do
  before(:each) do
    assign(:blogs, [
      Blog.create!(
        :allow_comments => false,
        :allow_public_comments => false,
        :role => "Role",
        :name => "Name",
        :content => "Content"
      ),
      Blog.create!(
        :allow_comments => false,
        :allow_public_comments => false,
        :role => "Role",
        :name => "Name",
        :content => "Content"
      )
    ])
  end

  it "renders a list of blogs" do
    render
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => "Role".to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Content".to_s, :count => 2
  end
end
