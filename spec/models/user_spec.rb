require 'spec_helper'

RSpec.describe User, type: :model do
  before do
  	@user = User.new(password: "Example User", email: "user@example.com")
end
  subject { @user }

  it { should respond_to(:password) }
  it { should respond_to(:email) }

  it { should be_valid }

  describe "when name is not present" do

    before { @user.email="fsfs@mail.ru"}
    it { should be_valid}
    
    describe "when name is not present" do

    before { @user.password = "a"*51 }
    it { should be_valid}

    end
    end
end
