require 'rails_helper'

RSpec.describe "messages/new", type: :view do
  before(:each) do
    assign(:message, Message.new(
      :title => "MyString",
      :body => "MyString",
      :user_id => 1,
      :user_to => 1
    ))
  end

  it "renders new message form" do
    render

    assert_select "form[action=?][method=?]", messages_path, "post" do

      assert_select "input#message_title[name=?]", "message[title]"

      assert_select "input#message_body[name=?]", "message[body]"

      assert_select "input#message_user_id[name=?]", "message[user_id]"

      assert_select "input#message_user_to[name=?]", "message[user_to]"
    end
  end
end
