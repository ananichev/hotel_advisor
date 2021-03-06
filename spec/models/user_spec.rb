require 'spec_helper'

describe User do
  
  before { @user = User.new(name: "Vitalik", email: "vit@esi.com", password: "12345678", password_confirmation: "12345678") }
  
  subject { @user }
  
  it { should respond_to(:name) }
  it { should respond_to(:email) }
  it { should respond_to(:password_digest) }
  it { should respond_to(:password) }
  it { should respond_to(:password_confirmation) }
  it { should respond_to(:authenticate) }
  it { should respond_to(:remember_token) }
  
  it { should be_valid }
  
  describe "remember token" do
    before { @user.save }
    its(:remember_token) { should_not be_blank }
  end
  
  describe "when name isn't present" do
  	before { @user.name = " " }
  	it { should_not be_valid }
  end
  
  describe "when email isn't present" do
  	before { @user.email = " " }
  	it { should_not be_valid }
  end
  
  describe "when name si too long" do
  	before { @user.name = "a"*51 }
  	it { should_not be_valid }
  end
  
  describe "when email format is invalid" do
    it "should be invalid" do
      addresses = %w[user@foo,com user_at_foo.org example.user@foo.
                     foo@bar_baz.com foo@bar+baz.com foo@bar..com]
      addresses.each do |invalid_address|
        @user.email = invalid_address
        expect(@user).not_to be_valid
      end
    end
  end

  describe "when email format is valid" do
    it "should be valid" do
      addresses = %w[user@foo.COM A_US-ER@f.b.org frst.lst@foo.jp a+b@baz.cn]
      addresses.each do |valid_address|
        @user.email = valid_address
        expect(@user).to be_valid
      end
    end
  end
  
  describe "when email is alredy taken" do
  	before do
  	  user_with_same_email = @user.dup
  	  user_with_same_email.save
  	  
  	  it { should_not be_valid }
  	end
  end
  
  describe "when password isn't present" do
  	before do
  	  @user = User.new(name: "Vitalik", email: "vit@esi.com", password: " ", password_confirmation: " ")
  	end
  	it { should_not be_valid }
  end
  
  describe "when password doesn't match confirmation" do
  	before { @user.password_confirmation = "foobar12" }
  	it { should_not be_valid }
  end
  
  describe "when password is too short" do
  	before { @user.password = @user.password_confirmation = "a"*5 }
  	it { should_not be_valid }
  end
  
  describe "return value of authenticate method" do
  	before { @user.save }
  	let(:found_user) { User.find_by(email: @user.email) }
  	
  	describe "when valid password" do
  	  it { should eq found_user.authenticate(@user.password) }
  	end
  	
  	describe "when invalid password" do
  	  let(:user_for_invalid_password) { found_user.authenticate("invalid") }
  	  
  	  it { should_not eq user_for_invalid_password }
  	  specify { expect(user_for_invalid_password).to be_false }
  	end
  end
end


















