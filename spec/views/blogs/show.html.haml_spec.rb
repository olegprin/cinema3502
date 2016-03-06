require 'rails_helper'

RSpec.describe "blogs/show", type: :view do
  before(:each) do
    @blog = assign(:blog, Blog.create!(
      :allow_comments => false,
      :allow_public_comments => false,
      :role => "Role",
      :name => "Name",
      :content => "Content"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/false/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/Role/)
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Content/)
  end
end
