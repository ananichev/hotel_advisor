require 'spec_helper'

describe "UserPages" do
  
  subject { page }
  
  describe "signup page" do
  	before { visit signup_path }
  	
  	it { it should have_title(full_title('Sign up')) }
  	it { it should have_content('Sign up') }
  end	

end
