require 'rails_helper'

RSpec.describe "postings/show", type: :view do
  before(:each) do
    @posting = assign(:posting, Posting.create!(
      :user_id => 1,
      :blog_id => 2,
      :body => "Body",
      :interpreter => "Interpreter",
      :recipient_group_ids => "Recipient Group Ids",
      :recipient_ids => "Recipient Ids"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/1/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/Body/)
    expect(rendered).to match(/Interpreter/)
    expect(rendered).to match(/Recipient Group Ids/)
    expect(rendered).to match(/Recipient Ids/)
  end
end
