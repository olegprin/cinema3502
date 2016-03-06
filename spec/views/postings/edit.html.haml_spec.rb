require 'rails_helper'

RSpec.describe "postings/edit", type: :view do
  before(:each) do
    @posting = assign(:posting, Posting.create!(
      :user_id => 1,
      :blog_id => 1,
      :body => "MyString",
      :interpreter => "MyString",
      :recipient_group_ids => "MyString",
      :recipient_ids => "MyString"
    ))
  end

  it "renders the edit posting form" do
    render

    assert_select "form[action=?][method=?]", posting_path(@posting), "post" do

      assert_select "input#posting_user_id[name=?]", "posting[user_id]"

      assert_select "input#posting_blog_id[name=?]", "posting[blog_id]"

      assert_select "input#posting_body[name=?]", "posting[body]"

      assert_select "input#posting_interpreter[name=?]", "posting[interpreter]"

      assert_select "input#posting_recipient_group_ids[name=?]", "posting[recipient_group_ids]"

      assert_select "input#posting_recipient_ids[name=?]", "posting[recipient_ids]"
    end
  end
end
