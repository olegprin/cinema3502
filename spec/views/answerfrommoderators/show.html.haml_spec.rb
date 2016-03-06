require 'rails_helper'

RSpec.describe "answerfrommoderators/show", type: :view do
  before(:each) do
    @answerfrommoderator = assign(:answerfrommoderator, Answerfrommoderator.create!(
      :user_id => 1,
      :send_message => "",
      :name => "Name",
      :content => "Content"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/1/)
    expect(rendered).to match(//)
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Content/)
  end
end
