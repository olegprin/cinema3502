require 'rails_helper'

RSpec.describe "answerfrommoderators/index", type: :view do
  before(:each) do
    assign(:answerfrommoderators, [
      Answerfrommoderator.create!(
        :user_id => 1,
        :send_message => "",
        :name => "Name",
        :content => "Content"
      ),
      Answerfrommoderator.create!(
        :user_id => 1,
        :send_message => "",
        :name => "Name",
        :content => "Content"
      )
    ])
  end

  it "renders a list of answerfrommoderators" do
    render
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Content".to_s, :count => 2
  end
end
