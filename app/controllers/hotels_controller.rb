class HotelsController < ApplicationController
  
  before_action :find_params, only: [:show, :edit, :update, :destroy]	

  def index
  	@hotels = Hotel.all
  end
  
  def show
  end
  
  def new
  	@hotel = Hotel.new
  end
  
  def create
  	@hotel = Hotel.new(hotel_params)
  	if @hotel.save
  	  flash[:success] = "Advise success created!"
  	  redirect_to @hotel
  	else
  	  render 'new'
    end
  end
    
  def edit
  end
  
  def update
  	if @hotel.update_attributes(hotel_params)
      flash[:success] = "Advise updated"
      redirect_to @hotel
    else
      render 'edit'
    end
  end
  
  def destroy
  	@hotel.destroy
  	redirect_to 'index'
  end
  
  private
 
    def hotel_params
      params.require(:hotel).permit(:title, :star_rating, :breakfast_included, :room_description, :price_for_room, :state, :city, :street, :hotels_country, :image)
    end
    
    def find_params
      @hotel = Hotel.find(params[:id])
    end
	
end