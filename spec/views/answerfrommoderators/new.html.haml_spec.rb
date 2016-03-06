require 'rails_helper'

RSpec.describe "answerfrommoderators/new", type: :view do
  before(:each) do
    assign(:answerfrommoderator, Answerfrommoderator.new(
      :user_id => 1,
      :send_message => "",
      :name => "MyString",
      :content => "MyString"
    ))
  end

  it "renders new answerfrommoderator form" do
    render

    assert_select "form[action=?][method=?]", answerfrommoderators_path, "post" do

      assert_select "input#answerfrommoderator_user_id[name=?]", "answerfrommoderator[user_id]"

      assert_select "input#answerfrommoderator_send_message[name=?]", "answerfrommoderator[send_message]"

      assert_select "input#answerfrommoderator_name[name=?]", "answerfrommoderator[name]"

      assert_select "input#answerfrommoderator_content[name=?]", "answerfrommoderator[content]"
    end
  end
end
