class HotelsController < ApplicationController
  
  before_action :find_params,    only: [:show, :edit, :update, :destroy]	
  before_action :signed_in_user, only: [:edit, :update]
  before_action :hotel_user,     only: [:edit, :update, :destroy]

  def index
    @hotels = Hotel.all.paginate(per_page: 10, page: params[:page] )
  end
  
  def show
  end
  
  def new
    @hotel = Hotel.new
  end
  
  def create
    @hotel = current_user.hotels.new(hotel_params)
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
    redirect_to action: 'index'
  end
  
  def tophotels
    @hotels = Hotel.where("star_rating > 3").order("star_rating DESC").limit(5)
  end
  
  private
 
    def hotel_params
      params.require(:hotel).permit(:title, :star_rating, :breakfast_included, :room_description, :price_for_room, :state, :city, :street, :hotels_country, :image, :user_id)
    end
    
    def find_params
      @hotel = Hotel.find(params[:id])
    end

    def hotel_user
      @hotel = Hotel.find(params[:id])
      redirect_to(root_url) unless @hotel.user == current_user 
    end
	
end
