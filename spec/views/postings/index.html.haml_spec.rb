require 'rails_helper'

RSpec.describe "postings/index", type: :view do
  before(:each) do
    assign(:postings, [
      Posting.create!(
        :user_id => 1,
        :blog_id => 2,
        :body => "Body",
        :interpreter => "Interpreter",
        :recipient_group_ids => "Recipient Group Ids",
        :recipient_ids => "Recipient Ids"
      ),
      Posting.create!(
        :user_id => 1,
        :blog_id => 2,
        :body => "Body",
        :interpreter => "Interpreter",
        :recipient_group_ids => "Recipient Group Ids",
        :recipient_ids => "Recipient Ids"
      )
    ])
  end

  it "renders a list of postings" do
    render
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "Body".to_s, :count => 2
    assert_select "tr>td", :text => "Interpreter".to_s, :count => 2
    assert_select "tr>td", :text => "Recipient Group Ids".to_s, :count => 2
    assert_select "tr>td", :text => "Recipient Ids".to_s, :count => 2
  end
end
