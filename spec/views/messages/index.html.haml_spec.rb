require 'rails_helper'

RSpec.describe "messages/index", type: :view do
  before(:each) do
    assign(:messages, [
      Message.create!(
        :title => "Title",
        :body => "Body",
        :user_id => 1,
        :user_to => 2
      ),
      Message.create!(
        :title => "Title",
        :body => "Body",
        :user_id => 1,
        :user_to => 2
      )
    ])
  end

  it "renders a list of messages" do
    render
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "Body".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
