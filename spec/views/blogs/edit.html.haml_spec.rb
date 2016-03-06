require 'rails_helper'

RSpec.describe "blogs/edit", type: :view do
  before(:each) do
    @blog = assign(:blog, Blog.create!(
      :allow_comments => false,
      :allow_public_comments => false,
      :role => "MyString",
      :name => "MyString",
      :content => "MyString"
    ))
  end

  it "renders the edit blog form" do
    render

    assert_select "form[action=?][method=?]", blog_path(@blog), "post" do

      assert_select "input#blog_allow_comments[name=?]", "blog[allow_comments]"

      assert_select "input#blog_allow_public_comments[name=?]", "blog[allow_public_comments]"

      assert_select "input#blog_role[name=?]", "blog[role]"

      assert_select "input#blog_name[name=?]", "blog[name]"

      assert_select "input#blog_content[name=?]", "blog[content]"
    end
  end
end
