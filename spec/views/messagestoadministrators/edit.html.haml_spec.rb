require 'rails_helper'

RSpec.describe "messagestoadministrators/edit", type: :view do
  before(:each) do
    @messagestoadministrator = assign(:messagestoadministrator, Messagestoadministrator.create!(
      :name => "MyString",
      :user_id => 1,
      :telephone => 1,
      :email => "MyString",
      :message => "MyString"
    ))
  end

  it "renders the edit messagestoadministrator form" do
    render

    assert_select "form[action=?][method=?]", messagestoadministrator_path(@messagestoadministrator), "post" do

      assert_select "input#messagestoadministrator_name[name=?]", "messagestoadministrator[name]"

      assert_select "input#messagestoadministrator_user_id[name=?]", "messagestoadministrator[user_id]"

      assert_select "input#messagestoadministrator_telephone[name=?]", "messagestoadministrator[telephone]"

      assert_select "input#messagestoadministrator_email[name=?]", "messagestoadministrator[email]"

      assert_select "input#messagestoadministrator_message[name=?]", "messagestoadministrator[message]"
    end
  end
end
