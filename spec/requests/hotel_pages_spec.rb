require 'spec_helper'

describe "HotelPages" do

  subject { page }
  
  describe "full description page" do
  	let(:hotel) { FactoryGirl.create(:hotel) }
  	before { visit hotel_path(hotel) }
  	
  	it { should have_title(hotel.title) }
  	it { should have_content(hotel.title) }
  end

end
