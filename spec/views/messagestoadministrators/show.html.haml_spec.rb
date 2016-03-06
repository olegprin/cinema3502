require 'rails_helper'

RSpec.describe "messagestoadministrators/show", type: :view do
  before(:each) do
    @messagestoadministrator = assign(:messagestoadministrator, Messagestoadministrator.create!(
      :name => "Name",
      :user_id => 1,
      :telephone => 2,
      :email => "Email",
      :message => "Message"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/1/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/Email/)
    expect(rendered).to match(/Message/)
  end
end
