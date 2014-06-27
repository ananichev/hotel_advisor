require 'spec_helper'

describe Hotel do
  
  before { @hotel = Hotel.new(title: "Plaza", star_rating: 5, breakfast_included: true, room_description: "Very nice room", price_for_room: 120, country: "Ukraine", city: "Lutsk", street: "Lenina") }
  
  subject { @hotel }
  
  it { should respond_to(:title) }
  it { should respond_to(:star_rating) }
  it { should respond_to(:breakfast_included) }
  it { should respond_to(:room_description) }
  it { should respond_to(:price_for_room) }
  it { should respond_to(:country) }
  it { should respond_to(:state) }
  it { should respond_to(:city) }
  it { should respond_to(:street) }
	
end
