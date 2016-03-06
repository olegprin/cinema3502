require 'rails_helper'

RSpec.describe "messages/edit", type: :view do
  before(:each) do
    @message = assign(:message, Message.create!(
      :title => "MyString",
      :body => "MyString",
      :user_id => 1,
      :user_to => 1
    ))
  end

  it "renders the edit message form" do
    render

    assert_select "form[action=?][method=?]", message_path(@message), "post" do

      assert_select "input#message_title[name=?]", "message[title]"

      assert_select "input#message_body[name=?]", "message[body]"

      assert_select "input#message_user_id[name=?]", "message[user_id]"

      assert_select "input#message_user_to[name=?]", "message[user_to]"
    end
  end
end
