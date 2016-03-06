require 'rails_helper'

RSpec.describe "messagestoadministrators/index", type: :view do
  before(:each) do
    assign(:messagestoadministrators, [
      Messagestoadministrator.create!(
        :name => "Name",
        :user_id => 1,
        :telephone => 2,
        :email => "Email",
        :message => "Message"
      ),
      Messagestoadministrator.create!(
        :name => "Name",
        :user_id => 1,
        :telephone => 2,
        :email => "Email",
        :message => "Message"
      )
    ])
  end

  it "renders a list of messagestoadministrators" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    assert_select "tr>td", :text => "Message".to_s, :count => 2
  end
end
